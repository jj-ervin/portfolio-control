<#
.SYNOPSIS
Validates or installs the development tools declared by a project.

.DESCRIPTION
Reads the project's .devtools.json contract, checks the active PowerShell
version, required PowerShell modules, and required commands, then reports one
deterministic readiness result. With -Install, missing PowerShell modules are
installed at CurrentUser scope before the contract is checked again.

.PARAMETER ProjectPath
Project directory containing .devtools.json.

.PARAMETER Install
Installs missing declared PowerShell modules at CurrentUser scope.

.PARAMETER Json
Emits the final readiness result as JSON.

.EXAMPLE
pwsh -NoProfile -File C:\dev\tools\dev-environment.ps1 -ProjectPath C:\dev\dxp-org\devxtoolkit-v1-x

.EXAMPLE
pwsh -NoProfile -File C:\dev\tools\dev-environment.ps1 -ProjectPath C:\dev\dxp-org\devxtoolkit-v1-x -Install
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter()]
    [string]$ProjectPath = (Get-Location).Path,

    [Parameter()]
    [switch]$Install,

    [Parameter()]
    [switch]$Json
)

$ErrorActionPreference = 'Stop'

function Resolve-PortfolioPath {
    param([Parameter(Mandatory = $true)][string]$Path)

    if ([System.IO.Path]::IsPathRooted($Path)) {
        return [System.IO.Path]::GetFullPath($Path)
    }

    return [System.IO.Path]::GetFullPath(
        (Join-Path -Path (Get-Location).Path -ChildPath $Path)
    )
}

function Get-EnvironmentState {
    param([Parameter(Mandatory = $true)][pscustomobject]$Contract)

    $minimumPowerShell = [version]$Contract.powershell.minimumVersion
    $moduleStates = foreach ($module in $Contract.powershell.modules) {
        $requiredVersion = [version]$module.version
        $available = Get-Module -ListAvailable -Name $module.name |
            Where-Object { $_.Version -eq $requiredVersion } |
            Select-Object -First 1

        [pscustomobject]@{
            Name = [string]$module.name
            RequiredVersion = $requiredVersion.ToString()
            AvailableVersion = if ($available) { $available.Version.ToString() } else { $null }
            Ready = [bool]$available
        }
    }

    $commandStates = foreach ($command in $Contract.commands) {
        $available = Get-Command -Name $command.name -ErrorAction SilentlyContinue |
            Select-Object -First 1
        [pscustomobject]@{
            Name = [string]$command.name
            Source = if ($available) { $available.Source } else { $null }
            Ready = [bool]$available
        }
    }

    $powerShellReady = $PSVersionTable.PSVersion -ge $minimumPowerShell
    $modulesReady = @($moduleStates | Where-Object { -not $_.Ready }).Count -eq 0
    $commandsReady = @($commandStates | Where-Object { -not $_.Ready }).Count -eq 0

    return [pscustomobject]@{
        Project = [string]$Contract.project
        PowerShell = [pscustomobject]@{
            RequiredVersion = $minimumPowerShell.ToString()
            AvailableVersion = $PSVersionTable.PSVersion.ToString()
            Ready = $powerShellReady
        }
        Modules = @($moduleStates)
        Commands = @($commandStates)
        Ready = $powerShellReady -and $modulesReady -and $commandsReady
    }
}

$resolvedProject = Resolve-PortfolioPath -Path $ProjectPath
$contractPath = Join-Path -Path $resolvedProject -ChildPath '.devtools.json'
if (-not (Test-Path -LiteralPath $contractPath -PathType Leaf)) {
    throw "Development-tool contract not found: $contractPath"
}

$contract = Get-Content -LiteralPath $contractPath -Raw | ConvertFrom-Json
if ($contract.schemaVersion -ne '1.0' -or
    [string]::IsNullOrWhiteSpace([string]$contract.project) -or
    -not $contract.powershell.minimumVersion) {
    throw "Invalid development-tool contract: $contractPath"
}

$state = Get-EnvironmentState -Contract $contract
if ($Install -and -not $state.Ready) {
    foreach ($module in $contract.powershell.modules) {
        $moduleState = $state.Modules | Where-Object { $_.Name -eq $module.name }
        if ($moduleState.Ready) {
            continue
        }

        $target = "$($module.name) $($module.version) at CurrentUser scope"
        if ($PSCmdlet.ShouldProcess($target, 'Install PowerShell module')) {
            $parameters = @{
                Name = [string]$module.name
                RequiredVersion = [string]$module.version
                Scope = 'CurrentUser'
                Force = $true
            }
            if ($module.allowClobber) {
                $parameters.AllowClobber = $true
            }
            if ($module.skipPublisherCheck) {
                $parameters.SkipPublisherCheck = $true
            }
            Install-Module @parameters
        }
    }

    $state = Get-EnvironmentState -Contract $contract
}

if ($Json) {
    $state | ConvertTo-Json -Depth 6
}
else {
    Write-Host "Development environment: $($state.Project)"
    Write-Host "PowerShell $($state.PowerShell.AvailableVersion) (required >= $($state.PowerShell.RequiredVersion)): $($state.PowerShell.Ready)"
    $state.Modules | Format-Table Name, RequiredVersion, AvailableVersion, Ready -AutoSize
    $state.Commands | Format-Table Name, Source, Ready -AutoSize
    if (-not $state.Ready) {
        Write-Host "Repair: pwsh -NoProfile -File `"$PSCommandPath`" -ProjectPath `"$resolvedProject`" -Install"
    }
}

if (-not $state.Ready) {
    exit 1
}

