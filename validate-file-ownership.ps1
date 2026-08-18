# validate-file-ownership.ps1
# Fails if any top-level item under C:\dev is owned by a Windows account other than
# the expected interactive owner (e.g. a sandboxed agent account left behind after a
# test run instead of being cleaned up or handed back).
#
# Usage:
#   .\validate-file-ownership.ps1                 — check all top-level items
#   .\validate-file-ownership.ps1 -TargetPath .    — check a specific root
#   .\validate-file-ownership.ps1 -Owner "ProX\Jess"  — override expected owner
#   .\validate-file-ownership.ps1 -AllowList "ProX\SomeApprovedService"
#   .\validate-file-ownership.ps1 -Help

param(
    [string] $TargetPath = ".",
    [string] $Owner = "$env:USERDOMAIN\$env:USERNAME",
    [string[]] $AllowList = @(),
    [switch] $Help
)

if ($Help) {
    Write-Host ""
    Write-Host "  validate-file-ownership.ps1 — check for foreign-owned files/dirs" -ForegroundColor White
    Write-Host ""
    Write-Host "  WHY THIS EXISTS" -ForegroundColor Cyan
    Write-Host "    Sandboxed agent runs (Codex offline sandbox, test harnesses, etc.) can"
    Write-Host "    execute under an alternate Windows account. If a run creates files and"
    Write-Host "    isn't cleaned up, those files stay owned by that account forever — silently,"
    Write-Host "    since git and normal file listings don't surface Windows ownership."
    Write-Host ""
    Write-Host "  CHECK" -ForegroundColor Cyan
    Write-Host "    Every top-level file/dir directly under -TargetPath must be owned by"
    Write-Host "    -Owner (default: the current interactive user) or listed in -AllowList."
    Write-Host ""
    Write-Host "  RULE" -ForegroundColor Cyan
    Write-Host "    Any process that runs as an alternate account (sandbox, service, CI) must"
    Write-Host "    either run against a throwaway path outside C:\dev, or reset ownership of"
    Write-Host "    everything it touched back to the interactive owner before the run ends."
    Write-Host "    Nothing under C:\dev should be left owned by a non-human/sandbox account"
    Write-Host "    as a side effect of a 'temporary' or 'test' run."
    Write-Host ""
    exit 0
}

$pass = $true
$violations = @()

Write-Host ""
Write-Host "  File ownership check ($TargetPath)" -ForegroundColor White
Write-Host "  Expected owner: $Owner" -ForegroundColor DarkGray
if ($AllowList.Count -gt 0) {
    Write-Host "  Allow-listed owners: $($AllowList -join ', ')" -ForegroundColor DarkGray
}
Write-Host ""

$items = Get-ChildItem -Path $TargetPath -Force -ErrorAction SilentlyContinue

foreach ($item in $items) {
    try {
        $itemOwner = (Get-Acl $item.FullName -ErrorAction Stop).Owner
    } catch {
        Write-Host ("  SKIP  {0} (could not read ACL: {1})" -f $item.Name, $_.Exception.Message) -ForegroundColor DarkYellow
        continue
    }

    $ok = ($itemOwner -ieq $Owner) -or ($AllowList | Where-Object { $_ -ieq $itemOwner })

    if ($ok) {
        Write-Host ("  OK    {0}" -f $item.Name) -ForegroundColor Green
    } else {
        $pass = $false
        $violations += [PSCustomObject]@{ Name = $item.Name; Owner = $itemOwner }
        Write-Host ("  FAIL  {0}  (owned by {1})" -f $item.Name, $itemOwner) -ForegroundColor Red
    }
}

Write-Host ""
if ($pass) {
    Write-Host "  All top-level items owned by $Owner." -ForegroundColor Green
    exit 0
} else {
    Write-Host "  Ownership violation(s) found:" -ForegroundColor Red
    foreach ($v in $violations) {
        Write-Host ("    - {0}  ->  {1}" -f $v.Name, $v.Owner) -ForegroundColor DarkRed
    }
    Write-Host ""
    Write-Host "  Fix with: .\normalize-file-ownership.ps1 -DryRun" -ForegroundColor Yellow
    exit 1
}
