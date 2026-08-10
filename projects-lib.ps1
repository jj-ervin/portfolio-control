# projects-lib.ps1
# Shared parser for projects.yaml, dot-sourced by scripts that need the
# project list (name, on-disk path, visibility). Not a general YAML parser —
# relies on projects.yaml's consistent flat structure:
#   - name: <name>
#     path: <path>
#     ...
#     status: <status>
#     visibility: <public|private>
#
# If projects.yaml's structure changes, update this alongside it.

function Get-DevProjects {
    param([string] $ProjectsFile = (Join-Path $PSScriptRoot "projects.yaml"))

    $projects = @()
    $current  = $null

    foreach ($line in Get-Content -LiteralPath $ProjectsFile) {
        if ($line -match '^\s*-\s*name:\s*(.+)$') {
            if ($current) { $projects += [pscustomobject]$current }
            $current = @{ Name = $Matches[1].Trim(); Path = $null; Status = $null; Visibility = $null }
        } elseif ($current -and $line -match '^\s*path:\s*(.+)$') {
            $current.Path = $Matches[1].Trim()
        } elseif ($current -and $line -match '^\s*status:\s*(.+)$') {
            $current.Status = $Matches[1].Trim()
        } elseif ($current -and $line -match '^\s*visibility:\s*(.+)$') {
            $current.Visibility = $Matches[1].Trim()
        }
    }
    if ($current) { $projects += [pscustomobject]$current }

    return $projects
}
