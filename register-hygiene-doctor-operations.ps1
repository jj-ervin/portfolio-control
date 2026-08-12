# Registers this portfolio's maintenance scripts as target-scoped Marlin
# Doctor operations. Idempotent: matching ids are replaced and unrelated
# custom operations are preserved.

param(
    [string] $Target = $PSScriptRoot
)

$ErrorActionPreference = "Stop"
$targetPath = (Resolve-Path -LiteralPath $Target).Path
$requiredScripts = @(
    "sync-dev-docs.ps1",
    "unignore-dev-docs.ps1",
    "set-repo-visibility.ps1"
)
foreach ($scriptName in $requiredScripts) {
    if (-not (Test-Path -LiteralPath (Join-Path $targetPath $scriptName) -PathType Leaf)) {
        throw "Doctor hygiene migration requires $scriptName under target $targetPath"
    }
}

$registryDir = Join-Path $targetPath ".marlin"
$registryPath = Join-Path $registryDir "doctor.operations.json"
if (Test-Path -LiteralPath $registryPath) {
    $registry = Get-Content -LiteralPath $registryPath -Raw | ConvertFrom-Json
    if ($registry.schema_version -ne "marlin.doctor.operations.v1") {
        throw "Unsupported Doctor operations registry schema: $($registry.schema_version)"
    }
    if ([IO.Path]::GetFullPath($registry.target_path) -ne [IO.Path]::GetFullPath($targetPath)) {
        throw "Doctor operations registry target mismatch: $($registry.target_path)"
    }
} else {
    $registry = [ordered]@{
        schema_version = "marlin.doctor.operations.v1"
        target_path = $targetPath
        operations = @()
    }
}

$operations = @(
    [ordered]@{
        id = "portfolio.dev-docs.sync"
        title = "Sync public-repo DEV-DOCS"
        description = "Extract public-repo DEV-DOCS into the private dev-docs repository."
        command = @("pwsh", "-NoProfile", "-File", "sync-dev-docs.ps1", "-Push")
        preview_command = @("pwsh", "-NoProfile", "-File", "sync-dev-docs.ps1", "-DryRun")
        cwd = "."
        mutates = $true
        requires_confirmation = $true
        supports_preview = $true
        output = "text"
        tags = @("portfolio", "dev-docs", "hygiene")
        enabled = $true
    },
    [ordered]@{
        id = "portfolio.dev-docs.unignore"
        title = "Unignore private-repo DEV-DOCS"
        description = "Stop ignoring DEV-DOCS in clean private repositories, then commit and push."
        command = @("pwsh", "-NoProfile", "-File", "unignore-dev-docs.ps1", "-Push")
        preview_command = @("pwsh", "-NoProfile", "-File", "unignore-dev-docs.ps1")
        cwd = "."
        mutates = $true
        requires_confirmation = $true
        supports_preview = $true
        output = "text"
        tags = @("portfolio", "dev-docs", "hygiene")
        enabled = $true
    },
    [ordered]@{
        id = "portfolio.repo-visibility.list"
        title = "List repository visibility routing"
        description = "List public/private DEV-DOCS routing from projects.yaml."
        command = @("pwsh", "-NoProfile", "-File", "set-repo-visibility.ps1", "-List")
        cwd = "."
        mutates = $false
        output = "text"
        tags = @("portfolio", "visibility", "hygiene")
        enabled = $true
    },
    [ordered]@{
        id = "portfolio.repo-visibility.set"
        title = "Set repository visibility routing"
        description = "Update one project's public/private DEV-DOCS routing in projects.yaml."
        command = @("pwsh", "-NoProfile", "-File", "set-repo-visibility.ps1", "-Repo", "{input.repo}", "-Visibility", "{input.visibility}")
        preview_command = @("pwsh", "-NoProfile", "-File", "set-repo-visibility.ps1", "-Repo", "{input.repo}", "-Visibility", "{input.visibility}", "-DryRun")
        cwd = "."
        mutates = $true
        requires_confirmation = $true
        supports_preview = $true
        output = "text"
        inputs = @(
            [ordered]@{ id = "repo"; label = "Repository"; type = "string"; required = $true },
            [ordered]@{ id = "visibility"; label = "Visibility"; type = "choice"; required = $true; choices = @("public", "private") }
        )
        tags = @("portfolio", "visibility", "hygiene")
        enabled = $true
    }
)

$operationIds = @($operations | ForEach-Object { $_.id })
$preserved = @($registry.operations | Where-Object { $_.id -notin $operationIds })
$registry.operations = @($preserved + $operations | Sort-Object id)
[IO.Directory]::CreateDirectory($registryDir) | Out-Null
$registry | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $registryPath -Encoding utf8

Write-Host "Registered $($operations.Count) hygiene operations in $registryPath" -ForegroundColor Green
