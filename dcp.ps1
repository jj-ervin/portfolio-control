# dcp.ps1
# Minimal DevX Control Plane command wrapper.

param(
    [Parameter(Position = 0)]
    [ValidateSet("init", "status", "validate", "validate-review", "validate-debt", "help")]
    [string]$Command = "help",

    [string]$TargetPath = ".",
    [switch]$Force,
    [switch]$NoHook,
    [switch]$Portfolio,
    [switch]$IncludeDocs
)

$TemplateRoot = $PSScriptRoot

function Show-Help {
    Write-Host ""
    Write-Host "  dcp - DevX Control Plane" -ForegroundColor White
    Write-Host ""
    Write-Host "  COMMANDS" -ForegroundColor Cyan
    Write-Host "    init       Scaffold DCP files into a portfolio root"
    Write-Host "    status     Run the portfolio dashboard"
    Write-Host "    validate   Verify planning pointers, review grammar, and structural debt"
    Write-Host "    validate-review"
    Write-Host "               Verify review grammar adoption"
    Write-Host "    validate-debt"
    Write-Host "               Scan tracked files for generated artifacts and debt markers"
    Write-Host "    help       Show this help"
    Write-Host ""
    Write-Host "  EXAMPLES" -ForegroundColor Cyan
    Write-Host "    .\dcp.ps1 init"
    Write-Host "    .\dcp.ps1 init -TargetPath C:\work"
    Write-Host "    .\dcp.ps1 init -TargetPath C:\work -Force"
    Write-Host "    .\dcp.ps1 status"
    Write-Host "    .\dcp.ps1 validate -TargetPath C:\work"
    Write-Host "    .\dcp.ps1 validate-debt -Portfolio -IncludeDocs"
    Write-Host ""
}

function Copy-DcpItem([string]$relativePath, [string]$targetRoot) {
    $source = Join-Path $TemplateRoot $relativePath
    $target = Join-Path $targetRoot $relativePath

    if (-not (Test-Path $source)) { return }

    $sourceFull = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($source)
    $targetFull = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($target)
    if ($sourceFull -eq $targetFull) {
        Write-Host "  self    $relativePath" -ForegroundColor DarkGray
        return
    }

    if ((Test-Path $target) -and -not $Force) {
        Write-Host "  exists  $relativePath" -ForegroundColor DarkGray
        return
    }

    $parent = Split-Path -Parent $target
    if ($parent -and -not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    Copy-Item -Path $source -Destination $target -Recurse -Force:$Force
    Write-Host "  copied  $relativePath" -ForegroundColor Green
}

function Invoke-Init {
    $targetRoot = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($TargetPath)
    if (-not (Test-Path $targetRoot)) {
        New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
    }

    Write-Host ""
    Write-Host "  DCP init" -ForegroundColor White
    Write-Host "  target: $targetRoot" -ForegroundColor DarkGray
    Write-Host ""

    $items = @(
        "CLAUDE.md",
        "PROTECTED.md",
        "README.md",
        "ONBOARDING.md",
        "DEV-CONTROL-PLANE.md",
        "DEV-PLAN.md",
        "DEV-PATH.md",
        "projects.yaml",
        "dev-status.ps1",
        "validate-pointers.ps1",
        "validate-review-grammar.ps1",
        "validate-debt.ps1",
        "protect-sources.ps1",
        "dcp-setup.ps1",
        "dcp.ps1",
        "docs\planning-normalization.md",
        "docs\REVIEW-GRAMMAR.md",
        "docs\GOVERNANCE-KIT.md",
        "docs\PLANNING-AUDIT.md",
        "docs\ADVERSARIAL-AUDIT.md",
        "docs\SKU-BOUNDARIES.md",
        "docs\PITCH.md",
        "docs\CONSULTING.md",
        "docs\DCP-INIT.md",
        "docs\templates",
        "docs\agent-kit",
        "docs\team-kit"
    )

    foreach ($item in $items) {
        Copy-DcpItem $item $targetRoot
    }

    if (-not $NoHook) {
        $gitRoot = git -C $targetRoot rev-parse --show-toplevel 2>$null
        if ($gitRoot) {
            $hookFile = Join-Path $gitRoot ".git\hooks\pre-commit"
            $guardScript = Join-Path $targetRoot "protect-sources.ps1"
            if ((Test-Path $hookFile) -and -not $Force) {
                Write-Host "  exists  .git\hooks\pre-commit" -ForegroundColor DarkGray
            } else {
                "#!/bin/sh`npwsh -File `"$guardScript`"" | Set-Content $hookFile -Encoding ASCII
                Write-Host "  wired   .git\hooks\pre-commit" -ForegroundColor Green
            }
        } else {
            Write-Host "  skip    pre-commit hook (target is not inside a git repo)" -ForegroundColor DarkYellow
        }
    }

    Write-Host ""
    Write-Host "  Next:" -ForegroundColor Cyan
    Write-Host "    1. Edit projects.yaml"
    Write-Host "    2. .\dcp.ps1 validate"
    Write-Host "    3. .\dcp.ps1 status"
    Write-Host ""
}

switch ($Command) {
    "init"     { Invoke-Init }
    "status"   { & (Join-Path $TemplateRoot "dev-status.ps1") }
    "validate" {
        & (Join-Path $TemplateRoot "validate-pointers.ps1") -TargetPath $TargetPath
        if (-not $?) { exit 1 }
        & (Join-Path $TemplateRoot "validate-review-grammar.ps1") -TargetPath $TargetPath
        if (-not $?) { exit 1 }
        & (Join-Path $TemplateRoot "validate-debt.ps1") -TargetPath $TargetPath
    }
    "validate-review" { & (Join-Path $TemplateRoot "validate-review-grammar.ps1") -TargetPath $TargetPath }
    "validate-debt" { & (Join-Path $TemplateRoot "validate-debt.ps1") -TargetPath $TargetPath -Portfolio:$Portfolio -IncludeDocs:$IncludeDocs }
    default    { Show-Help }
}
