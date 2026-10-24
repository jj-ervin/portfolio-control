param(
    [string] $Group = "",
    [switch] $DirtyOnly,
    [string] $TargetPath = $PSScriptRoot,
    [switch] $Help
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\dev-status.ps1"
& pwsh -NoProfile -File $tool -Group $Group -DirtyOnly:$DirtyOnly -TargetPath $TargetPath -Help:$Help
exit $LASTEXITCODE
