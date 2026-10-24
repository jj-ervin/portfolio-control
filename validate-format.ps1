param(
    [string] $TargetPath = $PSScriptRoot,
    [switch] $Help
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\validate-format.ps1"
$argsList = @("-NoProfile", "-File", $tool, "-TargetPath", $TargetPath)
if ($Help) {
    $argsList += "-Help"
}
& pwsh @argsList
exit $LASTEXITCODE
