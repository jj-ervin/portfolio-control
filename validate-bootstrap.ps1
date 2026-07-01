param(
    [switch] $Strict,
    [string] $Project = "",
    [string] $TargetPath = ".",
    [switch] $Help
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\validate-bootstrap.ps1"
& pwsh -NoProfile -File $tool -Strict:$Strict -Project $Project -TargetPath $TargetPath -Help:$Help
exit $LASTEXITCODE
