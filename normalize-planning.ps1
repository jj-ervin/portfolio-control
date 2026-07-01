param(
    [switch] $DryRun,
    [string] $TargetPath = "."
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\normalize-planning.ps1"
& pwsh -NoProfile -File $tool -DryRun:$DryRun -TargetPath $TargetPath
exit $LASTEXITCODE
