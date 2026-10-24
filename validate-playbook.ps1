param(
    [string] $TargetPath = $PSScriptRoot,
    [string] $FilePath = "",
    [switch] $Strict,
    [switch] $Help
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\validate-playbook.ps1"
$argsList = @("-NoProfile", "-File", $tool, "-TargetPath", $TargetPath)
if ($FilePath) {
    $argsList += @("-FilePath", $FilePath)
}
if ($Strict) {
    $argsList += "-Strict"
}
if ($Help) {
    $argsList += "-Help"
}
& pwsh @argsList
exit $LASTEXITCODE
