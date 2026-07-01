# sync-dev-docs.ps1
# Copies gitignored DEV-DOCS from each repo to Osprey OneDrive backup.
# Optionally commits and pushes to private GitHub remote (jj-ervin/dev-docs).
# Per DEV-ACCORD.08 (GC:2016) — DEV-DOCS are private by default.
#
# Usage:
#   .\sync-dev-docs.ps1              — sync OneDrive only, show summary
#   .\sync-dev-docs.ps1 -Push        — sync OneDrive + commit + push to private GitHub remote
#   .\sync-dev-docs.ps1 -DryRun      — preview what would change, no writes
#   .\sync-dev-docs.ps1 -Help        — show this help

param(
    [switch] $DryRun,
    [switch] $Push,
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  sync-dev-docs.ps1 — sync private DEV-DOCS to Osprey OneDrive" -ForegroundColor White
    Write-Host ""
    Write-Host "  USAGE" -ForegroundColor Cyan
    Write-Host "    .\sync-dev-docs.ps1 [flags]"
    Write-Host ""
    Write-Host "  FLAGS" -ForegroundColor Cyan
    Write-Host "    -Push      Commit and push changed files to github.com/jj-ervin/dev-docs"
    Write-Host "    -DryRun    Preview changes without writing"
    Write-Host "    -Help      Show this help"
    Write-Host ""
    Write-Host "  TARGET" -ForegroundColor Cyan
    Write-Host "    OneDrive - Osprey Strategic Holdings LLC\dev-docs\"
    Write-Host "    Structure: _root\  (portfolio root)  +  {repo}\  per project"
    Write-Host ""
    Write-Host "  WHAT IS SYNCED" -ForegroundColor Cyan
    Write-Host "    AGENTS.md, CHATGPT.md, CLAUDE.md, DEV-PATH.md, DEV-PLAN.md,"
    Write-Host "    DEV-RELEASE.md, DEV-TRACKS.md, REVIEW-GRAMMAR.md"
    Write-Host "    Root-level also: ONBOARDING.md, PROTECTED.md, projects.yaml"
    Write-Host ""
    exit 0
}

$DevRoot = $PSScriptRoot
$Dest    = "C:\Users\Jess\OneDrive - Osprey Strategic Holdings LLC\dev-docs"

if (-not (Test-Path $Dest)) {
    Write-Host ""
    Write-Host "  ERROR: OneDrive target not found: $Dest" -ForegroundColor Red
    Write-Host "  Ensure Osprey OneDrive is signed in and synced." -ForegroundColor Red
    Write-Host ""
    exit 1
}

# ── Files to collect from each repo root ──────────────────────────────────────
$PerRepoFiles = @(
    "AGENTS.md",
    "CHATGPT.md",
    "CLAUDE.md",
    "DEV-PATH.md",
    "DEV-PLAN.md",
    "DEV-RELEASE.md",
    "DEV-TRACKS.md",
    "REVIEW-GRAMMAR.md"
)

# ── Extra files from portfolio root only ──────────────────────────────────────
$RootOnlyFiles = @(
    "ONBOARDING.md",
    "PROTECTED.md",
    "DEV-CONTROL-PLANE.md",
    "projects.yaml"
)

# ── Discover repos: immediate subdirs that are git repos ──────────────────────
$Repos = Get-ChildItem $DevRoot -Directory |
    Where-Object {
        $_.Name -notlike '.*' -and
        $_.Name -notlike '_*' -and
        (Test-Path (Join-Path $_.FullName '.git'))
    } |
    Select-Object -ExpandProperty Name

# ── Helpers ───────────────────────────────────────────────────────────────────
$changed   = @()
$unchanged = @()
$missing   = @()

function Sync-File {
    param([string]$SrcFile, [string]$DestFile, [string]$Label)

    if (-not (Test-Path -LiteralPath $SrcFile)) {
        $script:missing += $Label
        return
    }

    $destParent = [System.IO.Path]::GetDirectoryName($DestFile)
    if (-not (Test-Path -LiteralPath $destParent)) {
        if (-not $DryRun) { [System.IO.Directory]::CreateDirectory($destParent) | Out-Null }
    }

    $srcHash  = (Get-FileHash -LiteralPath $SrcFile  -Algorithm MD5).Hash
    $destHash = if (Test-Path -LiteralPath $DestFile) {
        (Get-FileHash -LiteralPath $DestFile -Algorithm MD5).Hash
    } else { $null }

    if ($srcHash -eq $destHash) {
        $script:unchanged += $Label
        Write-Host ("  ──    {0}" -f $Label) -ForegroundColor DarkGray
    } else {
        $script:changed += $Label
        if (-not $DryRun) {
            [System.IO.File]::Copy($SrcFile, $DestFile, $true)
            Write-Host ("  SYNC  {0}" -f $Label) -ForegroundColor Green
        } else {
            $marker = if ($null -eq $destHash) { "(new)     " } else { "(changed) " }
            Write-Host ("  WOULD {0} {1}" -f $marker, $Label) -ForegroundColor Yellow
        }
    }
}

# ── Sync ──────────────────────────────────────────────────────────────────────
Write-Host ""
if ($DryRun) {
    Write-Host "  DRY RUN — no files will be written" -ForegroundColor DarkYellow
    Write-Host ""
}

# Root-level portfolio docs → _root\
Write-Host "  _root\" -ForegroundColor Cyan
$allRootFiles = $PerRepoFiles + $RootOnlyFiles
foreach ($file in $allRootFiles) {
    $src    = Join-Path $DevRoot $file
    $target = Join-Path $Dest "_root\$file"
    Sync-File -SrcFile $src -DestFile $target -Label "_root\$file"
}

# Per-repo docs
foreach ($repo in ($Repos | Sort-Object)) {
    $repoPath = Join-Path $DevRoot $repo
    $hasAny   = $PerRepoFiles | Where-Object { Test-Path (Join-Path $repoPath $_) }
    if (-not $hasAny) { continue }

    Write-Host ""
    Write-Host ("  {0}\" -f $repo) -ForegroundColor Cyan
    foreach ($file in $PerRepoFiles) {
        $src    = Join-Path $repoPath $file
        $target = Join-Path $Dest "$repo\$file"
        Sync-File -SrcFile $src -DestFile $target -Label "$repo\$file"
    }
}

# ── Summary ───────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host ("  {0} synced   {1} unchanged   {2} not present" -f $changed.Count, $unchanged.Count, $missing.Count) -ForegroundColor $(
    if ($changed.Count -gt 0) { "Green" } else { "DarkGray" }
)
Write-Host ""

# ── Private GitHub push ───────────────────────────────────────────────────────
if ($Push -and -not $DryRun) {
    $GitRemote = "https://github.com/jj-ervin/dev-docs.git"
    $GitDir    = Join-Path $Dest ".git"

    # Init repo if first run
    if (-not (Test-Path $GitDir)) {
        Write-Host "  Initialising private git repo in OneDrive target..." -ForegroundColor Cyan
        git -C $Dest init -b main | Out-Null
        git -C $Dest remote add origin $GitRemote | Out-Null
        Write-Host "  Remote set: $GitRemote" -ForegroundColor DarkGray
        Write-Host ""
    }

    $gitStatus = git -C $Dest status --short 2>$null
    if (-not $gitStatus) {
        Write-Host "  Git: nothing to commit — OneDrive already in sync with remote." -ForegroundColor DarkGray
        Write-Host ""
    } else {
        $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm")
        git -C $Dest add -A | Out-Null
        git -C $Dest commit -m "chore(sync): dev-docs backup $timestamp" | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  Committed. Pushing to github.com/jj-ervin/dev-docs..." -ForegroundColor Cyan
            git -C $Dest push origin main 2>&1 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  Pushed." -ForegroundColor Green
            } else {
                Write-Host "  Push failed — check remote access." -ForegroundColor Red
            }
        } else {
            Write-Host "  Commit failed." -ForegroundColor Red
        }
        Write-Host ""
    }
} elseif ($Push -and $DryRun) {
    Write-Host "  DRY RUN: would commit + push changed files to github.com/jj-ervin/dev-docs" -ForegroundColor DarkYellow
    Write-Host ""
}
