# validate-env-boundaries.ps1
# Fails if any C:\dev\*\.venv\Scripts path is leaking into User or Process PATH.
# Fails if `niji` resolves to anything other than %APPDATA%\marlin\bin\niji.cmd.
#
# Usage:
#   .\validate-env-boundaries.ps1          — check all boundaries
#   .\validate-env-boundaries.ps1 -Help    — show this help

param(
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  validate-env-boundaries.ps1 — check dev environment boundaries" -ForegroundColor White
    Write-Host ""
    Write-Host "  CHECKS" -ForegroundColor Cyan
    Write-Host "    1. No C:\dev\*\.venv\Scripts in User PATH"
    Write-Host "    2. No C:\dev\*\.venv\Scripts in current Process PATH"
    Write-Host "    3. 'niji' command resolves to %APPDATA%\marlin\bin\niji.cmd"
    Write-Host ""
    Write-Host "  BOUNDARY RULES" -ForegroundColor Cyan
    Write-Host "    C:\dev\niji\.venv  — niji dev venv, never in User PATH"
    Write-Host "    C:\dev\eco\.venv   — eco dev venv, never in User PATH"
    Write-Host "    C:\dev\marlin      — Node only, no Python venv"
    Write-Host "    %APPDATA%\marlin   — installed apps only (niji.cmd lives here)"
    Write-Host ""
    exit 0
}

$pass = $true

function Write-Check {
    param([string]$Label, [bool]$Ok, [string]$Detail = "")
    if ($Ok) {
        Write-Host ("  OK    {0}" -f $Label) -ForegroundColor Green
    } else {
        Write-Host ("  FAIL  {0}" -f $Label) -ForegroundColor Red
        if ($Detail) { Write-Host ("        {0}" -f $Detail) -ForegroundColor DarkRed }
    }
}

Write-Host ""
Write-Host "  Environment boundary check" -ForegroundColor White
Write-Host ""

# ── 1. User PATH — no dev venvs ───────────────────────────────────────────────
$userPath    = [System.Environment]::GetEnvironmentVariable("PATH", "User") ?? ""
$userLeaks   = ($userPath -split ";") | Where-Object {
    $_ -match [regex]::Escape("C:\dev\") -and $_ -imatch "\.venv\\Scripts"
}

if ($userLeaks) {
    $pass = $false
    foreach ($leak in $userLeaks) {
        Write-Check "User PATH clean" $false $leak
    }
} else {
    Write-Check "User PATH clean" $true
}

# ── 2. Process PATH — no dev venvs ────────────────────────────────────────────
$procPath    = $env:PATH ?? ""
$procLeaks   = ($procPath -split ";") | Where-Object {
    $_ -match [regex]::Escape("C:\dev\") -and $_ -imatch "\.venv\\Scripts"
}

if ($procLeaks) {
    $pass = $false
    foreach ($leak in $procLeaks) {
        Write-Check "Process PATH clean" $false $leak
    }
} else {
    Write-Check "Process PATH clean" $true
}

# ── 3. niji resolves to Marlin install, not a dev venv ────────────────────────
$expectedNiji = Join-Path $env:APPDATA "marlin\bin\niji.cmd"
$nijiCmd      = Get-Command niji -ErrorAction SilentlyContinue

if (-not $nijiCmd) {
    Write-Check "niji -> marlin install" $false "not found — run: marlin install niji"
    $pass = $false
} elseif ($nijiCmd.Source -ne $expectedNiji) {
    Write-Check "niji -> marlin install" $false ("resolves to: " + $nijiCmd.Source)
    $pass = $false
} else {
    Write-Check "niji -> marlin install" $true
}

# ── Result ────────────────────────────────────────────────────────────────────
Write-Host ""
if ($pass) {
    Write-Host "  All boundaries OK." -ForegroundColor Green
    exit 0
} else {
    Write-Host "  Boundary violation(s) found — see above." -ForegroundColor Red
    exit 1
}
