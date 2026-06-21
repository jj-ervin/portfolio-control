# validate-review-grammar.ps1
# Checks that a repo has an adoptable review grammar and agent instructions point to it.
#
# Usage:
#   pwsh -File validate-review-grammar.ps1
#   pwsh -File validate-review-grammar.ps1 -TargetPath C:\work\repo

param(
    [string]$TargetPath = ".",
    [string]$GrammarPath = "",
    [switch]$AllowMissingAgentInstructions
)

$root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($TargetPath)

if (-not (Test-Path $root)) {
    Write-Host "Target path does not exist: $TargetPath" -ForegroundColor Red
    exit 1
}

$grammarCandidates = @()
if ($GrammarPath) {
    $grammarCandidates += $GrammarPath
} else {
    $grammarCandidates += "docs/REVIEW-GRAMMAR.md"
    $grammarCandidates += ".governance/review-grammar.md"
    $grammarCandidates += "REVIEW-GRAMMAR.md"
}

$grammarFile = $null
foreach ($candidate in $grammarCandidates) {
    $full = Join-Path $root $candidate
    if (Test-Path $full) {
        $grammarFile = $full
        break
    }
}

$failures = @()
$warnings = @()

if (-not $grammarFile) {
    $failures += "No review grammar file found. Expected one of: $($grammarCandidates -join ', ')"
} else {
    $grammar = Get-Content $grammarFile -Raw
    $requiredTerms = @(
        "normalize",
        "validate",
        "verify",
        "adversarial audit",
        "meta-audit",
        "trace",
        "authority audit",
        "registry audit",
        "close the loop",
        "de-stale",
        "first-order review",
        "second-order review",
        "third-order review",
        "open",
        "spec-complete",
        "release-complete",
        "runtime-complete",
        "scope",
        "findings",
        "evidence",
        "validation",
        "next action"
    )

    foreach ($term in $requiredTerms) {
        if ($grammar -notmatch [regex]::Escape($term)) {
            $failures += "Review grammar missing required term: $term"
        }
    }
}

$agentCandidates = @(
    "AGENTS.md",
    "CLAUDE.md",
    ".github/copilot-instructions.md",
    ".governance/agents.md"
)

$agentFiles = @()
foreach ($candidate in $agentCandidates) {
    $full = Join-Path $root $candidate
    if (Test-Path $full) {
        $agentFiles += $full
    }
}

if ($agentFiles.Count -eq 0) {
    if ($AllowMissingAgentInstructions) {
        $warnings += "No common agent instruction file found."
    } else {
        $failures += "No common agent instruction file found. Expected one of: $($agentCandidates -join ', ')"
    }
} else {
    $referencesGrammar = $false
    foreach ($agentFile in $agentFiles) {
        $text = Get-Content $agentFile -Raw
        if ($text -match "REVIEW-GRAMMAR" -or $text -match "review grammar") {
            $referencesGrammar = $true
            break
        }
    }

    if (-not $referencesGrammar) {
        $failures += "Agent instruction files exist but none reference REVIEW-GRAMMAR."
    }
}

if ($failures.Count -gt 0) {
    Write-Host ""
    Write-Host "Review grammar validation failed:" -ForegroundColor Red
    $failures | ForEach-Object { Write-Host "  FAIL  $_" -ForegroundColor Yellow }
    if ($warnings.Count -gt 0) {
        Write-Host ""
        Write-Host "Warnings:" -ForegroundColor DarkYellow
        $warnings | ForEach-Object { Write-Host "  WARN  $_" -ForegroundColor DarkYellow }
    }
    Write-Host ""
    exit 1
}

Write-Host "Review grammar validation passed." -ForegroundColor Green
if ($grammarFile) {
    $display = Resolve-Path -Path $grammarFile -Relative
    Write-Host "  grammar: $display" -ForegroundColor DarkGray
}
if ($agentFiles.Count -gt 0) {
    Write-Host "  agent instruction files checked: $($agentFiles.Count)" -ForegroundColor DarkGray
}
if ($warnings.Count -gt 0) {
    $warnings | ForEach-Object { Write-Host "  WARN  $_" -ForegroundColor DarkYellow }
}
