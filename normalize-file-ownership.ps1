# normalize-file-ownership.ps1
# Fix-counterpart to validate-file-ownership.ps1.
# Resets ownership of any top-level item under -TargetPath that isn't owned by -Owner
# (or listed in -AllowList) back to -Owner, recursively.
#
# Usage:
#   .\normalize-file-ownership.ps1 -DryRun    — preview what would change
#   .\normalize-file-ownership.ps1            — apply
#
# NOTE: Taking ownership of another account's files requires SeTakeOwnershipPrivilege.
# If PowerShell isn't running elevated (Run as Administrator), every fix below will
# fail with "Access is denied" even for an account in the Administrators group,
# because Windows lists that group membership as deny-only until elevated.

param(
    [switch] $DryRun,
    [string] $TargetPath = ".",
    [string] $Owner = "$env:USERDOMAIN\$env:USERNAME",
    [string[]] $AllowList = @()
)

Write-Host ""
Write-Host "  File ownership normalize ($TargetPath)" -ForegroundColor White
Write-Host "  Target owner: $Owner" -ForegroundColor DarkGray
if ($DryRun) { Write-Host "  Mode: DRY RUN (no changes will be made)" -ForegroundColor Yellow }
Write-Host ""

$items = Get-ChildItem -Path $TargetPath -Force -ErrorAction SilentlyContinue
$toFix = @()

foreach ($item in $items) {
    try {
        $itemOwner = (Get-Acl $item.FullName -ErrorAction Stop).Owner
    } catch {
        continue
    }
    $ok = ($itemOwner -ieq $Owner) -or ($AllowList | Where-Object { $_ -ieq $itemOwner })
    if (-not $ok) {
        $toFix += [PSCustomObject]@{ Path = $item.FullName; Name = $item.Name; Owner = $itemOwner }
    }
}

if ($toFix.Count -eq 0) {
    Write-Host "  Nothing to fix — all top-level items already owned by $Owner." -ForegroundColor Green
    exit 0
}

$anyFailed = $false

foreach ($fix in $toFix) {
    if ($DryRun) {
        Write-Host ("  WOULD FIX  {0}  ({1} -> {2})" -f $fix.Name, $fix.Owner, $Owner) -ForegroundColor Yellow
        continue
    }

    Write-Host ("  Fixing {0} ..." -f $fix.Name) -ForegroundColor White
    $result = icacls "$($fix.Path)" /setowner "$Owner" /T /C 2>&1
    $failedLines = $result | Where-Object { $_ -match "Access is denied" }

    if ($failedLines) {
        $anyFailed = $true
        Write-Host ("  FAIL  {0} — access denied on {1} item(s)." -f $fix.Name, $failedLines.Count) -ForegroundColor Red
    } else {
        Write-Host ("  OK    {0} — ownership reset to {1}." -f $fix.Name, $Owner) -ForegroundColor Green
    }
}

Write-Host ""
if ($DryRun) {
    Write-Host "  Dry run complete. Re-run without -DryRun to apply." -ForegroundColor Yellow
    exit 0
}

if ($anyFailed) {
    Write-Host "  Some items could not be fixed." -ForegroundColor Red
    Write-Host "  Re-run this script from an elevated PowerShell (Run as Administrator)." -ForegroundColor Red
    Write-Host "  Administrators group membership is deny-only until elevated, so even an" -ForegroundColor DarkRed
    Write-Host "  admin account gets 'Access is denied' on icacls /setowner without elevation." -ForegroundColor DarkRed
    exit 1
} else {
    Write-Host "  All ownership violations fixed." -ForegroundColor Green
    exit 0
}
