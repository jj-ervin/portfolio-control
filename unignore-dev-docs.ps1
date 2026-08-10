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

. (Join-Path $PSScriptRoot "projects-lib.ps1")

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

# ── Repos to touch: every project.yaml entry marked private, wherever it's
# checked out on disk (including nested paths like dxp-org/devx-control-plane).
# Repos marked public are skipped — use sync-dev-docs.ps1 for those instead.
$Repos = Get-DevProjects |
    Where-Object { $_.Visibility -eq "private" -and $_.Path } |
    Sort-Object Name

$fixed   = @()
$clean   = @()
$dirty   = @()
$nothing = @()

Write-Host ""
foreach ($proj in $Repos) {
    $repo      = $proj.Name
    $repoPath  = Join-Path $DevRoot $proj.Path
    $gitignore = Join-Path $repoPath ".gitignore"

    if (-not (Test-Path $repoPath)) {
        Write-Host ("  SKIP  {0} — not checked out at {1}" -f $repo, $repoPath) -ForegroundColor DarkYellow
        $nothing += $repo
        continue
    }

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
