# sync-dcp.ps1
# Copies distributable DCP files from C:\dev (reference impl) to
# C:\dev\devx-control-plane (clean distribution repo).
#
# Usage:
#   .\sync-dcp.ps1              — sync and show diff summary
#   .\sync-dcp.ps1 -DryRun      — preview what would change, no writes
#   .\sync-dcp.ps1 -Commit      — sync and auto-commit in devx-control-plane
#   .\sync-dcp.ps1 -Help        — show this help

param(
    [switch] $DryRun,
    [switch] $Commit,
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  sync-dcp.ps1 — sync C:\dev → devx-control-plane distribution repo" -ForegroundColor White
    Write-Host ""
    Write-Host "  USAGE" -ForegroundColor Cyan
    Write-Host "    .\sync-dcp.ps1 [flags]"
    Write-Host ""
    Write-Host "  FLAGS" -ForegroundColor Cyan
    Write-Host "    -DryRun    Preview changes without writing"
    Write-Host "    -Commit    Auto-commit in devx-control-plane after sync"
    Write-Host "    -Help      Show this help"
    Write-Host ""
    Write-Host "  WHAT IS SYNCED" -ForegroundColor Cyan
    Write-Host "    Core tools, docs, and templates — no personal projects.yaml"
    Write-Host "    See `$SyncFiles in this script to add or remove entries"
    Write-Host ""
    exit 0
}

$Src  = $PSScriptRoot
$Dest = Join-Path $Src "devx-control-plane"

if (-not (Test-Path $Dest)) {
    Write-Host "ERROR: $Dest not found. Run: New-Item -ItemType Directory $Dest" -ForegroundColor Red
    exit 1
}

# ── Files to sync (source path relative to C:\dev) ────────────────────────────
$SyncFiles = @(
    "README.md",
    "DEV-CONTROL-PLANE.md",
    "DEVPLAN.md",
    "DEVPATH.md",
    "dev-status.ps1",
    "validate-pointers.ps1",
    "protect-sources.ps1",
    "docs\planning-normalization.md",
    "docs\PITCH.md",
    "ONBOARDING.md",
    "docs\templates\README.md",
    "docs\templates\DEV-PLAN.template.md",
    "docs\templates\DEV-PATH.template.md",
    "docs\templates\TRACKS.template.md",
    "docs\templates\PROJECT-STATUS.template.md"
)

# ── Sync ──────────────────────────────────────────────────────────────────────
$changed = @()
$unchanged = @()
$errors = @()

Write-Host ""
if ($DryRun) {
    Write-Host "  DRY RUN — no files will be written" -ForegroundColor DarkYellow
    Write-Host ""
}

foreach ($rel in $SyncFiles) {
    $srcFile  = Join-Path $Src $rel
    $destFile = Join-Path $Dest $rel

    if (-not (Test-Path $srcFile)) {
        $errors += $rel
        Write-Host ("  MISS  {0}" -f $rel) -ForegroundColor Red
        continue
    }

    $destDir = Split-Path $destFile
    if (-not (Test-Path $destDir)) {
        if (-not $DryRun) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
    }

    $srcHash  = (Get-FileHash $srcFile  -Algorithm MD5).Hash
    $destHash = if (Test-Path $destFile) { (Get-FileHash $destFile -Algorithm MD5).Hash } else { $null }

    if ($srcHash -eq $destHash) {
        $unchanged += $rel
        Write-Host ("  ──    {0}" -f $rel) -ForegroundColor DarkGray
    } else {
        $changed += $rel
        if (-not $DryRun) {
            Copy-Item $srcFile $destFile -Force
            Write-Host ("  SYNC  {0}" -f $rel) -ForegroundColor Green
        } else {
            $marker = if ($null -eq $destHash) { "(new)" } else { "(changed)" }
            Write-Host ("  WOULD {0}  {1}" -f $marker.PadRight(10), $rel) -ForegroundColor Yellow
        }
    }
}

# ── Summary ───────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host ("  {0} synced   {1} unchanged   {2} missing" -f $changed.Count, $unchanged.Count, $errors.Count) -ForegroundColor $(
    if ($errors.Count -gt 0) { "Yellow" } elseif ($changed.Count -gt 0) { "Green" } else { "DarkGray" }
)

if ($DryRun -or $changed.Count -eq 0) {
    Write-Host ""
    exit 0
}

# ── Git status in dest ────────────────────────────────────────────────────────
Write-Host ""
Write-Host "  devx-control-plane git status:" -ForegroundColor Cyan
$status = git -C $Dest status --short 2>$null
if ($status) {
    $status | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
} else {
    Write-Host "    clean" -ForegroundColor DarkGray
}
Write-Host ""

# ── Auto-commit ───────────────────────────────────────────────────────────────
if ($Commit -and $changed.Count -gt 0) {
    $fileList = $changed -join ", "
    $msg = "chore(sync): sync from C:\dev reference implementation`n`nUpdated: $fileList"
    git -C $Dest add -A
    git -C $Dest commit -m $msg
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Committed in devx-control-plane." -ForegroundColor Green
    } else {
        Write-Host "  Commit failed — check devx-control-plane manually." -ForegroundColor Red
    }
    Write-Host ""
}
