param(
    [string] $Group = "",
    [switch] $DirtyOnly,
    [string] $TargetPath = ".",
    [switch] $Help
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\dev-status.ps1"
& pwsh -NoProfile -File $tool -Group $Group -DirtyOnly:$DirtyOnly -TargetPath $TargetPath -Help:$Help
exit $LASTEXITCODE
