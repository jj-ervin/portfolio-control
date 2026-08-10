# unignore-dev-docs.ps1
# One-shot portfolio fix: for every already-PRIVATE repo under this dev root,
# stop gitignoring DEV-DOCS (AGENTS.md, DEV-PATH.md, DEV-PLAN.md, MARKET.md,
# DIST.md, etc.) and commit+push them like any other tracked file.
#
# Repos that must stay PUBLIC are skipped here — their DEV-DOCS still need to
# be extracted instead, via sync-dev-docs.ps1.
#
# Only touches repos with a clean working tree, so it never gets tangled up
# with in-progress work. Rerun any time; repos with nothing to unignore, or
# with local changes already, are skipped and reported.
#
# Usage:
#   .\unignore-dev-docs.ps1              — preview what would change, no writes
#   .\unignore-dev-docs.ps1 -Push        — apply + commit + push each changed repo
#   .\unignore-dev-docs.ps1 -Help        — show this help

param(
    [switch] $Push,
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  unignore-dev-docs.ps1 — stop gitignoring DEV-DOCS across private repos" -ForegroundColor White
    Write-Host ""
    Write-Host "  USAGE" -ForegroundColor Cyan
    Write-Host "    .\unignore-dev-docs.ps1 [-Push]"
    Write-Host ""
    exit 0
}

$DevRoot = $PSScriptRoot

# ── Repos that must stay PUBLIC — skip; use sync-dev-docs.ps1 for these instead ──
$PublicRepos = @(
    "eco-slate",
    "eco-slate-www",
    "marlin-registry",
    "governance-commons-www",
    "agent-dossier-www"
)

$DocFiles = @(
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

$Repos = Get-ChildItem $DevRoot -Directory |
    Where-Object {
        $_.Name -notlike '.*' -and
        $_.Name -notlike '_*' -and
        $_.Name -notin $PublicRepos -and
        (Test-Path (Join-Path $_.FullName '.git'))
    } |
    Select-Object -ExpandProperty Name |
    Sort-Object

$fixed   = @()
$clean   = @()
$dirty   = @()
$nothing = @()

Write-Host ""
foreach ($repo in $Repos) {
    $repoPath  = Join-Path $DevRoot $repo
    $gitignore = Join-Path $repoPath ".gitignore"

    if (-not (Test-Path $gitignore)) {
        $nothing += $repo
        continue
    }

    $lines  = Get-Content -LiteralPath $gitignore
    $kept   = $lines | Where-Object { $_.Trim() -notin $DocFiles }

    if ($kept.Count -eq $lines.Count) {
        $nothing += $repo
        continue
    }

    $status = git -C $repoPath status --porcelain 2>$null
    if ($status) {
        Write-Host ("  DIRTY {0} — has uncommitted changes, skipping" -f $repo) -ForegroundColor Yellow
        $dirty += $repo
        continue
    }

    if (-not $Push) {
        Write-Host ("  WOULD FIX  {0}" -f $repo) -ForegroundColor Cyan
        $fixed += $repo
        continue
    }

    Set-Content -LiteralPath $gitignore -Value $kept
    git -C $repoPath add -A | Out-Null
    $branch = (git -C $repoPath rev-parse --abbrev-ref HEAD).Trim()
    git -C $repoPath commit -m "chore: stop gitignoring DEV-DOCS (repo is private)" | Out-Null
    if ($LASTEXITCODE -eq 0) {
        git -C $repoPath push origin $branch 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host ("  FIXED  {0}" -f $repo) -ForegroundColor Green
            $fixed += $repo
        } else {
            Write-Host ("  PUSH FAILED  {0}" -f $repo) -ForegroundColor Red
        }
    } else {
        Write-Host ("  COMMIT FAILED  {0}" -f $repo) -ForegroundColor Red
    }
}

Write-Host ""
Write-Host ("  {0} fixed   {1} dirty (skipped)   {2} nothing to do" -f $fixed.Count, $dirty.Count, $nothing.Count) -ForegroundColor $(
    if ($fixed.Count -gt 0) { "Green" } else { "DarkGray" }
)
if (-not $Push -and $fixed.Count -gt 0) {
    Write-Host "  Preview only — rerun with -Push to apply, commit, and push." -ForegroundColor DarkYellow
}
Write-Host ""
