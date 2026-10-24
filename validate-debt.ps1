param(
    [string] $TargetPath = $PSScriptRoot,
    [switch] $IncludeDocs,
    [switch] $Portfolio,
    [string] $OutputJson
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\validate-debt.ps1"
& pwsh -NoProfile -File $tool -TargetPath $TargetPath -IncludeDocs:$IncludeDocs -Portfolio:$Portfolio -OutputJson $OutputJson
exit $LASTEXITCODE
