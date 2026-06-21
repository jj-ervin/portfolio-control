# validate-debt.ps1
# Lightweight structural debt scan for tracked repo files.
#
# Usage:
#   pwsh -File validate-debt.ps1 [-TargetPath C:\work] [-IncludeDocs]

param(
    [string]$TargetPath = ".",
    [switch]$IncludeDocs
)

$root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($TargetPath)

if (-not (Test-Path $root)) {
    Write-Host "Target path does not exist: $TargetPath" -ForegroundColor Red
    exit 1
}

$gitTop = git -C $root rev-parse --show-toplevel 2>$null
if (-not $gitTop) {
    Write-Host "Target path is not inside a git repo: $root" -ForegroundColor Red
    exit 1
}

$tracked = git -C $root ls-files
$failures = @()
$warnings = @()

$generatedPatterns = @(
    '(^|/)(__pycache__|\.pytest_cache|node_modules|dist|build|coverage)(/|$)',
    '\.py[cod]$',
    '\.egg-info/',
    '(^|/)parser_debug.*\.txt$',
    '(^|/)enforcement_debug\.yaml$',
    '(^|/)null$'
)

foreach ($path in $tracked) {
    foreach ($pattern in $generatedPatterns) {
        if ($path -match $pattern) {
            $failures += "Tracked generated/debug artifact: $path"
            break
        }
    }
}

$scanPaths = $tracked | Where-Object {
    $_ -match '\.(ps1|py|js|ts|tsx|jsx|mjs|cjs|json|yaml|yml|toml)$'
}

if ($IncludeDocs) {
    $scanPaths += ($tracked | Where-Object { $_ -match '\.(md|mdx|txt)$' })
    $scanPaths = $scanPaths | Select-Object -Unique
}

$markerPattern = '(?i)\b(shim|compatibility shim|legacy shim|polyfill|deprecated|workaround|backcompat)\b'

foreach ($path in $scanPaths) {
    $full = Join-Path $gitTop $path
    if (-not (Test-Path $full)) { continue }

    $lineNo = 0
    foreach ($line in Get-Content $full) {
        $lineNo++
        if ($line -notmatch $markerPattern) { continue }

        $normalized = $path -replace '\\', '/'
        if ($normalized -match '(^|/)(archive|docs/archive|docs/sources|passes|passchangelog)(/|$)') {
            continue
        }

        $warnings += "${path}:${lineNo}: debt marker: $($line.Trim())"
    }
}

if ($failures.Count -gt 0) {
    Write-Host ""
    Write-Host "Debt validation failed:" -ForegroundColor Red
    $failures | ForEach-Object { Write-Host "  FAIL  $_" -ForegroundColor Yellow }
    if ($warnings.Count -gt 0) {
        Write-Host ""
        Write-Host "Warnings:" -ForegroundColor DarkYellow
        $warnings | Select-Object -First 50 | ForEach-Object { Write-Host "  WARN  $_" -ForegroundColor DarkYellow }
        if ($warnings.Count -gt 50) {
            Write-Host "  WARN  ... $($warnings.Count - 50) more warnings omitted" -ForegroundColor DarkYellow
        }
    }
    Write-Host ""
    exit 1
}

Write-Host "Debt validation passed." -ForegroundColor Green
Write-Host "  tracked files checked: $($tracked.Count)" -ForegroundColor DarkGray
if ($warnings.Count -gt 0) {
    Write-Host "  warnings: $($warnings.Count)" -ForegroundColor DarkYellow
    $warnings | Select-Object -First 50 | ForEach-Object { Write-Host "  WARN  $_" -ForegroundColor DarkYellow }
    if ($warnings.Count -gt 50) {
        Write-Host "  WARN  ... $($warnings.Count - 50) more warnings omitted" -ForegroundColor DarkYellow
    }
}
