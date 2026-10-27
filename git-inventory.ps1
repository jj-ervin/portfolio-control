$PortfolioRoot = Split-Path -Parent $PSScriptRoot

$paths = @(
    $PortfolioRoot,
    ".eco",
    "arche",
    "cockpit",
    "cxp",
    "dev-docs",
    "devx-control-plane",
    "devxtoolkit-v1-x",
    "devxtoolkit-v1-x-registry",
    "devxtoolkit-v2-x",
    "doc-vault-plane",
    "dotgovernance",
    "eco",
    "eco-edge",
    "eco-edge\remote",
    "eco-slate",
    "eco-slate-www",
    "eco-slate-www\.eco",
    "eco-vscode",
    "elan",
    "eos",
    "eos\remote",
    "governance-commons",
    "governance-commons\agent-dossier",
    "governance-commons\agent-dossier-www",
    "governance-commons\agent-matrix",
    "governance-commons\agent-matrix\remote",
    "governance-commons\agent-project-orchestrator",
    "governance-commons\agent-project-orchestrator\remote",
    "governance-commons\agent-roster",
    "governance-commons\agent-team-protocol",
    "governance-commons\governance-commons-sdk",
    "governance-commons\governance-commons-www",
    "governance-commons\governance-commons-www\remote",
    "governance-commons\ons",
    "governance-commons\ons\remote",
    "governed-event",
    "kinjuu",
    "lasso",
    "marlin",
    "marlin-registry",
    "niji",
    "niji\remote",
    "powershell",
    "time-loc",
    "tools\flutter",
    "studio\publishing\trust-but-verify",
    "zz-archive\legacy-reconciliation-evidence\devtoolkit-legacy-archived"
)

$results = @()

foreach ($p in $paths) {
    if ([System.IO.Path]::IsPathRooted($p)) {
        $absPath = $p
    } else {
        $absPath = [System.IO.Path]::GetFullPath((Join-Path $PortfolioRoot $p))
    }
    
    if (-not (Test-Path $absPath -PathType Container)) {
        $results += [PSCustomObject]@{
            Path = $absPath
            Exists = $false
            IsGit = $false
            Branch = "N/A"
            Upstream = "N/A"
            Status = "N/A"
            Error = "Folder does not exist"
        }
        continue
    }
    
    # Check if a .git subdirectory or file exists inside this directory
    $gitDir = Join-Path $absPath ".git"
    $isGit = (Test-Path $gitDir)
    
    if (-not $isGit) {
        # Check if git recognizes this exact directory as a repo root
        Push-Location $absPath
        try {
            $toplevel = git rev-parse --show-toplevel 2>$null
            if ($null -ne $toplevel) {
                $topPath = [System.IO.Path]::GetFullPath($toplevel)
                $normPath = [System.IO.Path]::GetFullPath($absPath)
                if ($topPath -eq $normPath) {
                    $isGit = $true
                }
            }
        } catch {}
        Pop-Location
    }
    
    if (-not $isGit) {
        $results += [PSCustomObject]@{
            Path = $absPath
            Exists = $true
            IsGit = $false
            Branch = "N/A"
            Upstream = "N/A"
            Status = "N/A"
            Error = "Not a git repository root"
        }
        continue
    }
    
    Push-Location $absPath
    try {
        $branch = git branch --show-current 2>$null
        if ([string]::IsNullOrWhitespace($branch)) {
            $branch = git rev-parse --short HEAD 2>$null
            if ($null -eq $branch) {
                # Could be a brand new repo with no commits Yet
                $branch = "No commits yet"
            } else {
                $branch = "(Detached HEAD: $branch)"
            }
        }
        
        $upstream = git rev-parse --abbrev-ref --symbolic-full-name "@{upstream}" 2>$null
        if ($null -eq $upstream -or [string]::IsNullOrWhitespace($upstream)) {
            $upstream = "N/A"
        }
        
        # Git status --short
        $statusShort = git status --short 2>$null
        if ($null -eq $statusShort -or [string]::IsNullOrWhitespace($statusShort)) {
            $statusShort = ""
        } else {
            $statusShort = ($statusShort -join "`n")
        }
        
        $results += [PSCustomObject]@{
            Path = $absPath
            Exists = $true
            IsGit = $true
            Branch = $branch
            Upstream = $upstream
            Status = $statusShort
            Error = ""
        }
    } catch {
        $results += [PSCustomObject]@{
            Path = $absPath
            Exists = $true
            IsGit = $true
            Branch = "Error"
            Upstream = "Error"
            Status = "Error"
            Error = $_.Exception.Message
        }
    } finally {
        Pop-Location
    }
}

$totalChecked = $results.Count
$totalGit = ($results | Where-Object { $_.IsGit }).Count
$totalDirty = ($results | Where-Object { $_.IsGit -and $_.Status -ne "" }).Count
$totalNoUpstream = ($results | Where-Object { $_.IsGit -and $_.Upstream -eq "N/A" -and $_.Branch -ne "No commits yet" }).Count
$totalNotExists = ($results | Where-Object { -not $_.Exists }).Count
$totalNotGit = ($results | Where-Object { $_.Exists -and -not $_.IsGit }).Count

Write-Host "--- GIT INVENTORY REPORT ---" -ForegroundColor Cyan
Write-Host "Total checked paths: $totalChecked"
Write-Host "Git repositories found: $totalGit"
Write-Host "Dirty repositories: $totalDirty"
Write-Host "Repositories without Upstream: $totalNoUpstream"
Write-Host "Missing paths: $totalNotExists"
Write-Host "Non-git paths: $totalNotGit"
Write-Host ""

Write-Host "--- DIRTY REPOSITORIES ---" -ForegroundColor Red
$results | Where-Object { $_.IsGit -and $_.Status -ne "" } | ForEach-Object {
    Write-Host "Path: $($_.Path)" -ForegroundColor Yellow
    Write-Host "Branch: $($_.Branch)"
    Write-Host "Upstream: $($_.Upstream)"
    Write-Host "Status:"
    Write-Host $_.Status
    Write-Host ("-" * 40)
}

Write-Host ""
Write-Host "--- REPOSITORIES WITH MISSING/ANOMALOUS UPSTREAM ---" -ForegroundColor Yellow
$results | Where-Object { $_.IsGit -and ($_.Upstream -eq "N/A" -and $_.Branch -ne "No commits yet") } | ForEach-Object {
    Write-Host "Path: $($_.Path)"
    Write-Host "Branch: $($_.Branch)"
    Write-Host "Upstream: (No Upstream)"
    Write-Host ("-" * 40)
}

Write-Host ""
Write-Host "--- MISSING OR NON-GIT PATHS ---" -ForegroundColor DarkGray
$results | Where-Object { -not $_.IsGit -or -not $_.Exists } | ForEach-Object {
    Write-Host "Path: $($_.Path) | Exists: $($_.Exists) | IsGit: $($_.IsGit) | Detail: $($_.Error)"
}

Write-Host ""
Write-Host "--- ALL GIT REPOSITORIES LIST ---" -ForegroundColor Green
$results | Where-Object { $_.IsGit } | Format-Table Path, Branch, Upstream, @{Name="Dirty"; Expression={if($_.Status -ne ""){"True"}else{"False"}}} -AutoSize
