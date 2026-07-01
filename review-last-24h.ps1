param(
    [int] $Hours = 24,
    [switch] $Deep,
    [switch] $Deeper,
    [switch] $Summary,
    [string] $TargetPath = "."
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\review-last-24h.ps1"
& pwsh -NoProfile -File $tool -Hours $Hours -Deep:$Deep -Deeper:$Deeper -Summary:$Summary -TargetPath $TargetPath
exit $LASTEXITCODE
