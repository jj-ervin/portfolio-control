param(
    [string] $TargetPath = ".",
    [string] $GrammarPath = "",
    [switch] $AllowMissingAgentInstructions
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\validate-review-grammar.ps1"
& pwsh -NoProfile -File $tool -TargetPath $TargetPath -GrammarPath $GrammarPath -AllowMissingAgentInstructions:$AllowMissingAgentInstructions
exit $LASTEXITCODE
