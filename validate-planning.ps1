param(
    [switch] $Strict,
    [string] $Project = "",
    [string] $TargetPath = $PSScriptRoot,
    [switch] $Help
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\validate-planning.ps1"
& pwsh -NoProfile -File $tool -Strict:$Strict -Project $Project -TargetPath $TargetPath -Help:$Help
exit $LASTEXITCODE
