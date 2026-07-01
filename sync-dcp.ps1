# sync-dcp.ps1
# Copies distributable DCP files from this portfolio root to
# dxp-org\devx-control-plane (clean distribution repo).
#
# Usage:
#   .\sync-dcp.ps1              — sync and show diff summary
#   .\sync-dcp.ps1 -DryRun      — preview what would change, no writes
#   .\sync-dcp.ps1 -Commit      — sync and auto-commit in dxp-org\devx-control-plane
#   .\sync-dcp.ps1 -Help        — show this help

param(
    [switch] $DryRun,
    [switch] $Commit,
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  sync-dcp.ps1 — sync this portfolio root → dxp-org\devx-control-plane distribution repo" -ForegroundColor White
    Write-Host ""
    Write-Host "  USAGE" -ForegroundColor Cyan
    Write-Host "    .\sync-dcp.ps1 [flags]"
    Write-Host ""
    Write-Host "  FLAGS" -ForegroundColor Cyan
    Write-Host "    -DryRun    Preview changes without writing"
    Write-Host "    -Commit    Auto-commit in dxp-org\devx-control-plane after sync"
    Write-Host "    -Help      Show this help"
    Write-Host ""
    Write-Host "  WHAT IS SYNCED" -ForegroundColor Cyan
    Write-Host "    Core tools, docs, and templates — no personal projects.yaml"
    Write-Host "    See `$SyncFiles in this script to add or remove entries"
    Write-Host ""
    exit 0
}

$Src  = $PSScriptRoot
$Dest = Join-Path $Src "dxp-org\devx-control-plane"

if (-not (Test-Path $Dest)) {
    Write-Host "ERROR: $Dest not found. Run: New-Item -ItemType Directory $Dest" -ForegroundColor Red
    exit 1
}

# ── Files to sync (source path relative to this portfolio root) ───────────────
$SyncFiles = @(
    "AGENTS.md",
    "CLAUDE.md",
    "PROTECTED.md",
    "README.md",
    "DEV-CONTROL-PLANE.md",
    "DEV-PLAN.md",
    "DEV-PATH.md",
    # entrypoint + setup
    "dcp.ps1",
    "dcp-setup.ps1",
    # status + reporting
    "dev-status.ps1",
    "dev-report.ps1",
    # atomic validators
    "validate-bootstrap.ps1",
    "validate-planning.ps1",
    "validate-pointers.ps1",
    "validate-review-grammar.ps1",
    "validate-debt.ps1",
    # normalizers
    "normalize-bootstrap.ps1",
    "normalize-planning.ps1",
    "normalize-pointers.ps1",
    # composite review
    "validate-recent-work.ps1",
    "review-last-24h.ps1",
    # maintenance
    "protect-sources.ps1",
    "sync-dcp.ps1",
    # GC-AUDIT authority and standards required by registry-backed tools
    "governance-commons\gc-audit\GC-AUDIT-REGISTRY.yaml",
    "governance-commons\gc-audit\README.md",
    "governance-commons\gc-audit\tools\dev-report.ps1",
    "governance-commons\gc-audit\tools\dev-status.ps1",
    "governance-commons\gc-audit\tools\normalize-bootstrap.ps1",
    "governance-commons\gc-audit\tools\normalize-planning.ps1",
    "governance-commons\gc-audit\tools\normalize-pointers.ps1",
    "governance-commons\gc-audit\tools\review-last-24h.ps1",
    "governance-commons\gc-audit\tools\validate-bootstrap.ps1",
    "governance-commons\gc-audit\tools\validate-debt.ps1",
    "governance-commons\gc-audit\tools\validate-planning.ps1",
    "governance-commons\gc-audit\tools\validate-pointers.ps1",
    "governance-commons\gc-audit\tools\validate-recent-work.ps1",
    "governance-commons\gc-audit\tools\validate-review-grammar.ps1",
    "governance-commons\passes\dev-accord\DEV-ACCORD.00.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.01.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.02.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.03.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.04.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.05.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.06.md",
    "governance-commons\passes\dev-accord\DEV-ACCORD.07.md",
    # index
    "SCRIPTS.md",
    "docs\planning-normalization.md",
    "docs\REVIEW-GRAMMAR.md",
    "docs\PITCH.md",
    "docs\GOVERNANCE-KIT.md",
    "docs\PLANNING-AUDIT.md",
    "docs\ADVERSARIAL-AUDIT.md",
    "docs\SKU-BOUNDARIES.md",
    "docs\CONSULTING.md",
    "docs\DCP-INIT.md",
    "docs\agent-kit\AGENT-KIT.md",
    "docs\agent-kit\TASK-TEMPLATE.md",
    "docs\agent-kit\ROUTING-PATTERNS.md",
    "docs\agent-kit\AGENT-ONBOARDING.md",
    "docs\agent-kit\HANDOFF-PROTOCOL.md",
    "docs\team-kit\TEAM-KIT.md",
    "docs\team-kit\REVIEW-ROUTING.md",
    "docs\team-kit\TEAM-ONBOARDING.md",
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
Write-Host "  dxp-org\devx-control-plane git status:" -ForegroundColor Cyan
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
    $msg = "chore(sync): sync DCP distribution`n`nSource: $Src`nUpdated: $fileList"
    git -C $Dest add -A
    git -C $Dest commit -m $msg
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  Committed in dxp-org\devx-control-plane." -ForegroundColor Green
    } else {
        Write-Host "  Commit failed — check dxp-org\devx-control-plane manually." -ForegroundColor Red
    }
    Write-Host ""
}
