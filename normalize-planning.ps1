param(
    [switch] $DryRun,
    [string] $TargetPath = $PSScriptRoot
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\normalize-planning.ps1"
& pwsh -NoProfile -File $tool -DryRun:$DryRun -TargetPath $TargetPath
exit $LASTEXITCODE
