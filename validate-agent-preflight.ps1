param(
    [Parameter(ParameterSetName = 'File', Mandatory = $true)]
    [string]$FilePath,

    [Parameter(ParameterSetName = 'Text', Mandatory = $true)]
    [string]$Text,

    [ValidateSet('FirstResponse', 'Session')]
    [string]$Mode = 'FirstResponse',

    [int]$SearchWindow = 40,

    [switch]$Help
)

$tool = Join-Path $PSScriptRoot "governance-commons\gc-audit\tools\validate-agent-preflight.ps1"

if ($PSCmdlet.ParameterSetName -eq 'Text') {
    & pwsh -NoProfile -File $tool -Text $Text -Mode $Mode -SearchWindow $SearchWindow -Help:$Help
    exit $LASTEXITCODE
}

& pwsh -NoProfile -File $tool -FilePath $FilePath -Mode $Mode -SearchWindow $SearchWindow -Help:$Help
exit $LASTEXITCODE
