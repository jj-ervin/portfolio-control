# dcp-setup.ps1
# Run once after using this as a GitHub template or cloning directly.
# Wires the pre-commit hook, validates planning pointers, and shows the dashboard.
#
# Usage:
#   .\dcp-setup.ps1        — run setup
#   .\dcp-setup.ps1 -Help  — show this help

param([switch]$Help)

if ($Help) {
    Write-Host ""
    Write-Host "  dcp-setup.ps1 — one-time setup for a new DCP instance" -ForegroundColor White
    Write-Host ""
    Write-Host "  WHAT IT DOES" -ForegroundColor Cyan
    Write-Host "    1. Wires protect-sources.ps1 as a git pre-commit hook"
    Write-Host "    2. Runs validate-pointers.ps1 against projects.yaml"
    Write-Host "    3. Runs dev-status.ps1 to show your portfolio dashboard"
    Write-Host "    4. Prints next steps"
    Write-Host ""
    Write-Host "  AFTER SETUP" -ForegroundColor Cyan
    Write-Host "    Edit projects.yaml to register your repos."
    Write-Host "    Run .\validate-pointers.ps1 any time you add or rename plan files."
    Write-Host "    See ONBOARDING.md for the full setup guide."
    Write-Host ""
    exit 0
}

Write-Host ""
Write-Host "  DevX Control Plane — Setup" -ForegroundColor White
Write-Host ""

# ── Git check ─────────────────────────────────────────────────────────────────
$gitRoot = git rev-parse --show-toplevel 2>$null
if (-not $gitRoot) {
    Write-Host "  ERROR: not inside a git repo. Run: git init" -ForegroundColor Red
    exit 1
}

# ── Pre-commit hook ────────────────────────────────────────────────────────────
$hookFile = Join-Path $gitRoot ".git\hooks\pre-commit"
$guardScript = Join-Path $PSScriptRoot "protect-sources.ps1"

if (Test-Path $hookFile) {
    Write-Host "  pre-commit hook already exists — skipping." -ForegroundColor DarkGray
} else {
    "#!/bin/sh`npwsh -File `"$guardScript`"" | Set-Content $hookFile -Encoding ASCII
    Write-Host "  pre-commit hook wired  (protect-sources.ps1)" -ForegroundColor Green
}

# ── Validate pointers ──────────────────────────────────────────────────────────
Write-Host ""
Write-Host "  Validating planning pointers..." -ForegroundColor Cyan
& "$PSScriptRoot\validate-pointers.ps1"

# ── Dashboard ─────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "  Portfolio dashboard:" -ForegroundColor Cyan
& "$PSScriptRoot\dev-status.ps1"

# ── Next steps ────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "  Setup complete. Next steps:" -ForegroundColor Green
Write-Host ""
Write-Host "    1. Edit projects.yaml — replace example entries with your repos"
Write-Host "    2. .\validate-pointers.ps1   — verify pointers after each edit"
Write-Host "    3. .\dev-status.ps1          — live portfolio dashboard"
Write-Host "    4. ONBOARDING.md             — full setup guide"
Write-Host "    5. docs\templates\           — planning doc templates"
Write-Host ""
