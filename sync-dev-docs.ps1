# sync-dev-docs.ps1
# Extracts private DEV-DOCS for the small number of repos that must stay
# PUBLIC on GitHub, and pushes them into the private jj-ervin/dev-docs repo.
#
# Every other repo in this portfolio is already private on GitHub, so its
# DEV-DOCS just live there directly, tracked normally in that repo's own
# history — no sync, no OneDrive, no separate backup step needed.
#
# Per DEV-ACCORD.08 (GC:2016) — DEV-DOCS are private by default.
#
# Usage:
#   .\sync-dev-docs.ps1              — preview what would sync, no writes
#   .\sync-dev-docs.ps1 -Push        — sync + commit + push to jj-ervin/dev-docs
#   .\sync-dev-docs.ps1 -DryRun      — alias for the default preview behavior
#   .\sync-dev-docs.ps1 -Help        — show this help

param(
    [switch] $DryRun,
    [switch] $Push,
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  sync-dev-docs.ps1 — extract DEV-DOCS for public repos into the private dev-docs repo" -ForegroundColor White
    Write-Host ""
    Write-Host "  USAGE" -ForegroundColor Cyan
    Write-Host "    .\sync-dev-docs.ps1 [-Push]"
    Write-Host ""
    Write-Host "  WHY THIS SCRIPT IS NARROW" -ForegroundColor Cyan
    Write-Host "    Most repos in this portfolio are private on GitHub, so their DEV-DOCS"
    Write-Host "    (DEV-PATH.md, DEV-PLAN.md, MARKET.md, DIST.md, etc.) live there directly,"
    Write-Host "    tracked normally, committed like anything else. This script only exists"
    Write-Host "    for the handful of repos that must stay PUBLIC — their DEV-DOCS can't"
    Write-Host "    live in-repo, so this pulls them into the private dev-docs repo instead."
    Write-Host ""
    Write-Host "  TARGET" -ForegroundColor Cyan
    Write-Host "    {DevRoot}\dev-docs  (local clone of github.com/jj-ervin/dev-docs)"
    Write-Host ""
    exit 0
}

$DevRoot    = $PSScriptRoot
$DocsRepo   = Join-Path $DevRoot "dev-docs"
$DocsRemote = "https://github.com/jj-ervin/dev-docs.git"

# ── Repos that must stay PUBLIC on GitHub — the only ones this script touches ──
# Everything else in the portfolio is already private; its DEV-DOCS live there
# directly and need no extraction. Update this list if a repo's visibility changes.
$PublicRepos = @(
    "eco-slate",
    "eco-slate-www",
    "marlin-registry",
    "governance-commons-www",
    "agent-dossier-www"
)

$PerRepoFiles = @(
    "AGENTS.md",
    "CHATGPT.md",
    "CLAUDE.md",
    "DEV-PATH.md",
    "DEV-PLAN.md",
    "DEV-RELEASE.md",
    "DEV-TRACKS.md",
    "REVIEW-GRAMMAR.md",
    "MARKET.md",
    "DIST.md"
)

# ── Ensure local dev-docs clone exists ─────────────────────────────────────────
if (-not (Test-Path (Join-Path $DocsRepo ".git"))) {
    Write-Host "  Cloning jj-ervin/dev-docs into $DocsRepo ..." -ForegroundColor Cyan
    git clone $DocsRemote $DocsRepo
    Write-Host ""
}

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

foreach ($repo in ($PublicRepos | Sort-Object)) {
    $repoPath = Join-Path $DevRoot $repo
    if (-not (Test-Path $repoPath)) {
        Write-Host ("  SKIP  {0} — not checked out under {1}" -f $repo, $DevRoot) -ForegroundColor DarkYellow
        continue
    }

    Write-Host ("  {0}\" -f $repo) -ForegroundColor Cyan
    foreach ($file in $PerRepoFiles) {
        $src    = Join-Path $repoPath $file
        $target = Join-Path $DocsRepo "$repo\$file"
        Sync-File -SrcFile $src -DestFile $target -Label "$repo\$file"
    }
    Write-Host ""
}

# ── Summary ───────────────────────────────────────────────────────────────────
Write-Host ("  {0} synced   {1} unchanged   {2} not present" -f $changed.Count, $unchanged.Count, $missing.Count) -ForegroundColor $(
    if ($changed.Count -gt 0) { "Green" } else { "DarkGray" }
)
Write-Host ""

# ── Private GitHub push ───────────────────────────────────────────────────────
if ($Push -and -not $DryRun) {
    $gitStatus = git -C $DocsRepo status --short 2>$null
    if (-not $gitStatus) {
        Write-Host "  Git: nothing to commit — dev-docs already in sync with remote." -ForegroundColor DarkGray
        Write-Host ""
    } else {
        $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm")
        git -C $DocsRepo add -A | Out-Null
        git -C $DocsRepo commit -m "chore(sync): dev-docs backup $timestamp" | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  Committed. Pushing to github.com/jj-ervin/dev-docs..." -ForegroundColor Cyan
            git -C $DocsRepo push origin main 2>&1 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
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
