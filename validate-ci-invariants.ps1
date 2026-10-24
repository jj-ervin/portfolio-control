param(
    [string] $Project = "",
    [string] $TargetPath = $PSScriptRoot,
    [switch] $Help
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\validate-ci-invariants.ps1"
$argsList = @("-NoProfile", "-File", $tool, "-TargetPath", $TargetPath)
if ($Project) {
    $argsList += @("-Project", $Project)
}
if ($Help) {
    $argsList += "-Help"
}
& pwsh @argsList
exit $LASTEXITCODE
