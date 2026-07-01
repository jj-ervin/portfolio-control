param(
    [string] $Project = "",
    [switch] $GapOnly,
    [switch] $DetailOnly,
    [string] $Output = "",
    [string] $TargetPath = ".",
    [switch] $Help
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\dev-report.ps1"
& pwsh -NoProfile -File $tool -Project $Project -GapOnly:$GapOnly -DetailOnly:$DetailOnly -Output $Output -TargetPath $TargetPath -Help:$Help
exit $LASTEXITCODE
