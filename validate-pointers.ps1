param(
    [string] $TargetPath = $PSScriptRoot,
    [switch] $FixNotes
)

$tool = Join-Path (Split-Path -Parent $PSScriptRoot) "governance-commons\gc-audit\tools\validate-pointers.ps1"
& pwsh -NoProfile -File $tool -TargetPath $TargetPath -FixNotes:$FixNotes
exit $LASTEXITCODE
