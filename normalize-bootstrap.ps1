param(
    [switch] $DryRun,
    [string] $TargetPath = ".",
    [string] $Project = ""
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\normalize-bootstrap.ps1"
& pwsh -NoProfile -File $tool -DryRun:$DryRun -TargetPath $TargetPath -Project $Project
exit $LASTEXITCODE
