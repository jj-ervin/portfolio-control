param(
    [switch] $DryRun,
    [string] $TargetPath = $PSScriptRoot,
    [string] $Project = ""
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\normalize-bootstrap.ps1"
& pwsh -NoProfile -File $tool -DryRun:$DryRun -TargetPath $TargetPath -Project $Project
exit $LASTEXITCODE
