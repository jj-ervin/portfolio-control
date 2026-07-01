param(
    [int] $Hours = 24,
    [ValidateRange(1,4)]
    [int] $Level = 1,
    [string] $TargetPath = ".",
    [switch] $Summary
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\validate-recent-work.ps1"
& pwsh -NoProfile -File $tool -Hours $Hours -Level $Level -TargetPath $TargetPath -Summary:$Summary
exit $LASTEXITCODE
