# set-repo-visibility.ps1
# Adds/removes a repo from the public/private DEV-DOCS sync requirement by
# updating its `visibility:` field in projects.yaml — the single source of
# truth sync-dev-docs.ps1 and unignore-dev-docs.ps1 both read from.
#
# This only updates routing metadata here. It does NOT change the repo's
# actual GitHub visibility — do that in GitHub settings yourself, and run
# it on the same side of the change:
#   flipping private -> public: change GitHub visibility first, then run
#     this, then run sync-dev-docs.ps1 -Push to extract its DEV-DOCS.
#   flipping public -> private: run this and change GitHub visibility
#     first, then run unignore-dev-docs.ps1 -Push to bring DEV-DOCS in-repo.
#
# Usage:
#   .\set-repo-visibility.ps1 -List
#   .\set-repo-visibility.ps1 -Repo marlin-registry -Visibility public
#   .\set-repo-visibility.ps1 -Repo trust-but-verify -Visibility private
#   .\set-repo-visibility.ps1 -Repo marlin-registry -Visibility public -DryRun
#   .\set-repo-visibility.ps1 -Help

param(
    [string] $Repo,
    [ValidateSet("public", "private")] [string] $Visibility,
    [switch] $List,
    [switch] $DryRun,
    [switch] $Help
)

. (Join-Path $PSScriptRoot "projects-lib.ps1")

if ($Help -or (-not $List -and (-not $Repo -or -not $Visibility))) {
    Write-Host ""
    Write-Host "  set-repo-visibility.ps1 — manage the public/private DEV-DOCS sync list" -ForegroundColor White
    Write-Host ""
    Write-Host "  USAGE" -ForegroundColor Cyan
    Write-Host "    .\set-repo-visibility.ps1 -List"
    Write-Host "    .\set-repo-visibility.ps1 -Repo <name> -Visibility <public|private>"
    Write-Host "    .\set-repo-visibility.ps1 -Repo <name> -Visibility <public|private> -DryRun"
    Write-Host ""
    exit 0
}

$ProjectsFile = Join-Path $PSScriptRoot "projects.yaml"
$Projects     = Get-DevProjects -ProjectsFile $ProjectsFile

if ($List) {
    Write-Host ""
    Write-Host "  PUBLIC  (DEV-DOCS extracted to jj-ervin/dev-docs)" -ForegroundColor Cyan
    $Projects | Where-Object { $_.Visibility -eq "public" } | Sort-Object Name | ForEach-Object {
        Write-Host ("    {0}" -f $_.Name)
    }
    Write-Host ""
    Write-Host "  PRIVATE  (DEV-DOCS live in-repo)" -ForegroundColor Cyan
    $Projects | Where-Object { $_.Visibility -eq "private" } | Sort-Object Name | ForEach-Object {
        Write-Host ("    {0}" -f $_.Name)
    }
    $unset = $Projects | Where-Object { -not $_.Visibility }
    if ($unset) {
        Write-Host ""
        Write-Host "  UNSET  (no visibility field — treated as neither by the sync scripts)" -ForegroundColor Yellow
        $unset | Sort-Object Name | ForEach-Object { Write-Host ("    {0}" -f $_.Name) }
    }
    Write-Host ""
    exit 0
}

$match = $Projects | Where-Object { $_.Name -eq $Repo }
if (-not $match) {
    Write-Host ""
    Write-Host ("  No project named '{0}' in projects.yaml." -f $Repo) -ForegroundColor Red
    $close = $Projects | Where-Object { $_.Name -like "*$Repo*" } | Select-Object -ExpandProperty Name
    if ($close) {
        Write-Host "  Did you mean:" -ForegroundColor Yellow
        $close | ForEach-Object { Write-Host ("    {0}" -f $_) }
    }
    Write-Host ""
    exit 1
}

if ($match.Visibility -eq $Visibility) {
    Write-Host ""
    Write-Host ("  {0} is already '{1}'. No change." -f $Repo, $Visibility) -ForegroundColor DarkGray
    Write-Host ""
    exit 0
}

$oldVisibility = $match.Visibility
$lines   = Get-Content -LiteralPath $ProjectsFile
$out     = @()
$inBlock = $false
$done    = $false

foreach ($line in $lines) {
    if ($line -match '^\s*-\s*name:\s*(.+)$') {
        $inBlock = ($Matches[1].Trim() -eq $Repo)
    }
    if ($inBlock -and -not $done -and $line -match '^(\s*visibility:\s*).+$') {
        $out += "$($Matches[1])$Visibility"
        $done = $true
    } else {
        $out += $line
    }
}

if (-not $done) {
    Write-Host ""
    Write-Host ("  '{0}' has no visibility: line to update — add one under its status: line manually." -f $Repo) -ForegroundColor Red
    Write-Host ""
    exit 1
}

if (-not $DryRun) {
    Set-Content -LiteralPath $ProjectsFile -Value $out
}

Write-Host ""
if ($DryRun) {
    Write-Host ("  WOULD CHANGE  {0}: {1} -> {2}" -f $Repo, $oldVisibility, $Visibility) -ForegroundColor Cyan
    Write-Host "  Preview only — projects.yaml was not changed." -ForegroundColor DarkYellow
    Write-Host ""
    exit 0
}
Write-Host ("  {0}: {1} -> {2}" -f $Repo, $oldVisibility, $Visibility) -ForegroundColor Green
if ($Visibility -eq "public") {
    Write-Host "  Next: make the GitHub repo public (if not already), then run:" -ForegroundColor DarkGray
    Write-Host "    .\sync-dev-docs.ps1 -Push" -ForegroundColor DarkGray
} else {
    Write-Host "  Next: make the GitHub repo private (if not already), then run:" -ForegroundColor DarkGray
    Write-Host "    .\unignore-dev-docs.ps1 -Push" -ForegroundColor DarkGray
}
Write-Host ""
