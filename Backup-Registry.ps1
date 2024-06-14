function Backup-Registry {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Status
    )


    Write-Host "==============================================================================="
    $backupFile = "$ScriptFolder\TRS-TT-NetOpt-$Status-tweaks-backup-Interfaces-$timestamp.reg" 
    Write-Host "Backing up $backupFile..." -ForegroundColor Yellow
    reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" $backupFile 
    if (Test-Path $backupFile) {
        Write-Host "Backup completed for HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -ForegroundColor Green
    } else {
        Write-Host "Backup file not found. Check the file path and permissions." -ForegroundColor Red
    }

    # ... repeat for other registry keys ...
}
