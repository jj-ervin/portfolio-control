param(
    [string] $TargetPath = ".",
    [switch] $FixNotes
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\validate-pointers.ps1"
& pwsh -NoProfile -File $tool -TargetPath $TargetPath -FixNotes:$FixNotes
exit $LASTEXITCODE
