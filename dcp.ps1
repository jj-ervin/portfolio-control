# dcp.ps1
# DevX Control Plane — unified command wrapper.
# See SCRIPTS.md for the full script reference and five-minute onboarding.

param(
    [Parameter(Position = 0)]
    [ValidateSet(
        "init",
        "status", "report",
        "validate", "validate-bootstrap", "validate-planning",
        "validate-review", "validate-debt",
        "normalize", "normalize-bootstrap", "normalize-planning", "normalize-pointers",
        "diagnose", "review",
        "help"
    )]
    [string]$Command = "help",

    # shared
    [string]$TargetPath  = ".",
    [switch]$Force,
    [switch]$NoHook,
    [switch]$DryRun,

    # validate-debt
    [switch]$Portfolio,
    [switch]$IncludeDocs,
    [string]$OutputJson,

    # dev-report
    [switch]$GapOnly,
    [switch]$DetailOnly,
    [string]$Output,

    # diagnose / review
    [ValidateRange(1,4)]
    [int]   $Level   = 1,
    [int]   $Hours   = 24,
    [switch]$Deep,
    [switch]$Deeper,
    [switch]$Summary
)

$TemplateRoot = $PSScriptRoot

# ── help ─────────────────────────────────────────────────────────────────────

function Show-Help {
    Write-Host ""
    Write-Host "  dcp — DevX Control Plane" -ForegroundColor White
    Write-Host ""
    Write-Host "  SETUP" -ForegroundColor Cyan
    Write-Host "    init             Scaffold DCP files into a portfolio root"
    Write-Host ""
    Write-Host "  STATUS" -ForegroundColor Cyan
    Write-Host "    status           Git status dashboard for all repos in projects.yaml"
    Write-Host "    report           Planning gap report (DEV-ACCORD.00 / GC:2008)"
    Write-Host "    report -GapOnly  Gap table only"
    Write-Host ""
    Write-Host "  VALIDATE (atomic — each checks one thing)" -ForegroundColor Cyan
    Write-Host "    validate         Run all five validators in sequence"
    Write-Host "    validate-bootstrap   AGENTS.md conformance (DEV-ACCORD.04)"
    Write-Host "    validate-planning    Planning doc structure (DEV-ACCORD.00)"
    Write-Host "    validate-review      Review grammar adoption"
    Write-Host "    validate-debt        Structural debt and generated-artifact scan"
    Write-Host ""
    Write-Host "  NORMALIZE (fix drift detected by validators)" -ForegroundColor Cyan
    Write-Host "    normalize            Run all three normalizers (dry run first recommended)"
    Write-Host "    normalize-bootstrap  Fix missing/broken AGENTS.md routing (DEV-ACCORD.04)"
    Write-Host "    normalize-planning   Rename non-standard planning doc names (DEV-ACCORD.00)"
    Write-Host "    normalize-pointers   Fix broken file pointers in projects.yaml"
    Write-Host "    Add -DryRun to preview any normalize command without writing files."
    Write-Host ""
    Write-Host "  COMPOSITE REVIEW" -ForegroundColor Cyan
    Write-Host "    diagnose         Multi-level diagnostic (default Level 1)"
    Write-Host "    diagnose -Level 2 -Hours 24   Recent-work review"
    Write-Host "    diagnose -Level 3              Adversarial audit"
    Write-Host "    diagnose -Level 4              Release readiness"
    Write-Host "    review           Closing ritual: Level 2 by default"
    Write-Host "    review -Deep     Level 3 (adversarial)"
    Write-Host "    review -Deeper   Level 4 (release readiness)"
    Write-Host ""
    Write-Host "  EXAMPLES" -ForegroundColor Cyan
    Write-Host "    .\dcp.ps1 status"
    Write-Host "    .\dcp.ps1 validate"
    Write-Host "    .\dcp.ps1 diagnose -Level 2 -Hours 48"
    Write-Host "    .\dcp.ps1 review -Deep"
    Write-Host "    .\dcp.ps1 normalize -DryRun"
    Write-Host "    .\dcp.ps1 normalize"
    Write-Host "    .\dcp.ps1 report -GapOnly"
    Write-Host "    .\dcp.ps1 init -TargetPath C:\work"
    Write-Host ""
    Write-Host "  See SCRIPTS.md for the full reference." -ForegroundColor DarkGray
    Write-Host ""
}

# ── init ─────────────────────────────────────────────────────────────────────

function Copy-DcpItem([string]$relativePath, [string]$targetRoot) {
    $source = Join-Path $TemplateRoot $relativePath
    $target = Join-Path $targetRoot  $relativePath

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
        # docs
        "CLAUDE.md"
        "PROTECTED.md"
        "README.md"
        "ONBOARDING.md"
        "SCRIPTS.md"
        "DEV-CONTROL-PLANE.md"
        "DEV-PLAN.md"
        "DEV-PATH.md"
        "projects.yaml"
        # scripts — entrypoint + setup
        "dcp.ps1"
        "dcp-setup.ps1"
        # scripts — status and reporting
        "dev-status.ps1"
        "dev-report.ps1"
        # scripts — atomic validators
        "validate-bootstrap.ps1"
        "validate-planning.ps1"
        "validate-pointers.ps1"
        "validate-review-grammar.ps1"
        "validate-debt.ps1"
        # scripts — normalizers
        "normalize-bootstrap.ps1"
        "normalize-planning.ps1"
        "normalize-pointers.ps1"
        # scripts — composite review
        "validate-recent-work.ps1"
        "review-last-24h.ps1"
        # scripts — maintenance
        "protect-sources.ps1"
        "sync-dcp.ps1"
        # docs subdirs
        "docs\planning-normalization.md"
        "docs\REVIEW-GRAMMAR.md"
        "docs\GOVERNANCE-KIT.md"
        "docs\PLANNING-AUDIT.md"
        "docs\ADVERSARIAL-AUDIT.md"
        "docs\SKU-BOUNDARIES.md"
        "docs\PITCH.md"
        "docs\CONSULTING.md"
        "docs\DCP-INIT.md"
        "docs\templates"
        "docs\agent-kit"
        "docs\team-kit"
    )

    foreach ($item in $items) {
        Copy-DcpItem $item $targetRoot
    }

    if (-not $NoHook) {
        $gitRoot = git -C $targetRoot rev-parse --show-toplevel 2>$null
        if ($gitRoot) {
            $hookFile    = Join-Path $gitRoot ".git\hooks\pre-commit"
            $guardScript = Join-Path $targetRoot "protect-sources.ps1"
            if ((Test-Path $hookFile) -and -not $Force) {
                Write-Host "  exists  .git\hooks\pre-commit" -ForegroundColor DarkGray
            } else {
                "#!/bin/sh`npwsh -File `"$guardScript`"" | Set-Content $hookFile -Encoding ASCII
                Write-Host "  wired   .git\hooks\pre-commit" -ForegroundColor Green
            }
        } else {
            Write-Host "  skip    pre-commit hook (not a git repo)" -ForegroundColor DarkYellow
        }
    }

    Write-Host ""
    Write-Host "  Next:" -ForegroundColor Cyan
    Write-Host "    1. Edit projects.yaml"
    Write-Host "    2. .\dcp.ps1 validate"
    Write-Host "    3. .\dcp.ps1 status"
    Write-Host "    4. .\dcp.ps1 diagnose"
    Write-Host ""
}

# ── dispatch ─────────────────────────────────────────────────────────────────

switch ($Command) {

    "init" { Invoke-Init }

    "status" {
        & (Join-Path $TemplateRoot "dev-status.ps1")
    }

    "report" {
        & (Join-Path $TemplateRoot "dev-report.ps1") `
            -GapOnly:$GapOnly -DetailOnly:$DetailOnly `
            -Output $Output
    }

    "validate" {
        $t = $TargetPath
        & (Join-Path $TemplateRoot "validate-bootstrap.ps1")       -TargetPath $t; if (-not $?) { exit 1 }
        & (Join-Path $TemplateRoot "validate-planning.ps1")        -TargetPath $t; if (-not $?) { exit 1 }
        & (Join-Path $TemplateRoot "validate-pointers.ps1")        -TargetPath $t; if (-not $?) { exit 1 }
        & (Join-Path $TemplateRoot "validate-review-grammar.ps1")  -TargetPath $t; if (-not $?) { exit 1 }
        & (Join-Path $TemplateRoot "validate-debt.ps1")            -TargetPath $t
    }

    "validate-bootstrap" {
        & (Join-Path $TemplateRoot "validate-bootstrap.ps1") -TargetPath $TargetPath
    }

    "validate-planning" {
        & (Join-Path $TemplateRoot "validate-planning.ps1") -TargetPath $TargetPath
    }

    "validate-review" {
        & (Join-Path $TemplateRoot "validate-review-grammar.ps1") -TargetPath $TargetPath
    }

    "validate-debt" {
        & (Join-Path $TemplateRoot "validate-debt.ps1") `
            -TargetPath $TargetPath -Portfolio:$Portfolio `
            -IncludeDocs:$IncludeDocs -OutputJson $OutputJson
    }

    "normalize" {
        & (Join-Path $TemplateRoot "normalize-bootstrap.ps1") -TargetPath $TargetPath -DryRun:$DryRun
        & (Join-Path $TemplateRoot "normalize-planning.ps1")  -TargetPath $TargetPath -DryRun:$DryRun
        & (Join-Path $TemplateRoot "normalize-pointers.ps1")  -TargetPath $TargetPath -DryRun:$DryRun
    }

    "normalize-bootstrap" {
        & (Join-Path $TemplateRoot "normalize-bootstrap.ps1") -TargetPath $TargetPath -DryRun:$DryRun
    }

    "normalize-planning" {
        & (Join-Path $TemplateRoot "normalize-planning.ps1") -TargetPath $TargetPath -DryRun:$DryRun
    }

    "normalize-pointers" {
        & (Join-Path $TemplateRoot "normalize-pointers.ps1") -TargetPath $TargetPath -DryRun:$DryRun
    }

    "diagnose" {
        & (Join-Path $TemplateRoot "validate-recent-work.ps1") `
            -TargetPath $TargetPath -Level $Level -Hours $Hours -Summary:$Summary
    }

    "review" {
        & (Join-Path $TemplateRoot "review-last-24h.ps1") `
            -Hours $Hours -Deep:$Deep -Deeper:$Deeper -Summary:$Summary
    }

    default { Show-Help }
}
