# TheRealSarcasmO's Ultimate Windows 11 Optimization Script
# If you're smart enough to use this, we salute you. If not, well, good luck meatbag.

# Set execution policy
Set-ExecutionPolicy Unrestricted -Force 2>> c:\temp\errorlog.txt

Write-Host "Welcome to TheRealSarcasmO's Ultimate Windows 11 Optimization Script. Do you wish to continue? (y/n)"
$answer = Read-Host

if ($answer -ne 'y') {
    Write-Host "Well, aren't we a scaredy cat? Goodbye, meatbag!"
    exit
}

Write-Host "Oh, a brave soul we have here. Let's get started, shall we?"
# Check if System Restore is enabled
$sysRestore = Get-ComputerRestorePoint
if (-not $sysRestore) {
    Write-Host "System Restore is not enabled on this system."
    exit
}

# Create a system restore point
$description = "Restore point before running TheRealSarcasmO's amazing optimization script"
Checkpoint-Computer -Description $description -RestorePointType "MODIFY_SETTINGS"

Write-Host "Hey Meatbag I Created a system restore point: $description"

# Get network adapters
$adapters = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object { $_.NetConnectionStatus -eq 2 } | Select-Object -Property Name, NetConnectionStatus

$adapterConfirmed = $false
while (-not $adapterConfirmed) {
    Write-Host "Please select a network adapter from the list below:"
    $index = 1
    $adapters | ForEach-Object {
        Write-Host "$index. $($_.Name)"
        $index++
    }

    $selectedAdapterIndex = Read-Host "Enter the number of the network adapter"
    $selectedAdapter = $adapters[$selectedAdapterIndex - 1]

    Write-Host "You selected the network adapter: $($selectedAdapter.Name)"
    $confirmation = Read-Host "Is this correct? (y/n)"

    if ($confirmation -eq 'y') {
        $adapterConfirmed = $true
        $selectedAdapterName = "$($selectedAdapter.Name)"
    }
}

# Check if speedtest.exe exists
$speedtestPath = "c:\temp\speedtest.exe"
if (!(Test-Path -Path $speedtestPath)) {
    Write-Host "Downloading speedtest.exe..."
    Invoke-WebRequest -Uri "https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-win64.zip" -OutFile "c:\temp\speedtest.zip" 2>> c:\temp\errorlog.txt
    Expand-Archive -Path "c:\temp\speedtest.zip" -DestinationPath "." 2>> c:\temp\errorlog.txt
    Remove-Item -Path "c:\temp\speedtest.zip" 2>> c:\temp\errorlog.txt
}

# Run speed test before optimization
Write-Host "Running speed test before optimization..."
$beforeSpeedTest = & $speedtestPath --format=json --accept-license --accept-gdpr | ConvertFrom-Json 2>> c:\temp\errorlog.txt
$beforeDownloadMbps = [math]::Round($beforeSpeedTest.download.bandwidth / 125000, 2)
$beforeUploadMbps = [math]::Round($beforeSpeedTest.upload.bandwidth / 125000, 2)
Write-Host "Speed test before optimization: Download $($beforeDownloadMbps) Mbps, Upload $($beforeUploadMbps) Mbps" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

Read-Host "Press Enter to continue..."

# Kill not responding tasks
taskkill /F /FI "STATUS eq NOT RESPONDING" 2>> c:\temp\errorlog.txt
Write-Host "Killed tasks that were not responding" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Kill specific tasks
taskkill /f /im firefox.exe /im chrome.exe /im iexplore.exe /im speedtest.exe /im regedit.exe 2>> c:\temp\errorlog.txt
Write-Host "Killed Firefox, Chrome, Speedtest, regedit and Internet Explorer tasks" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Backup registry
$timestamp = Get-Date -Format "yyyy-MM-dd-HHmmss"
$backupFile = "c:\temp\TRS-TT-SystemOpt-before_tweaks_backup_Interfaces_$timestamp.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" $backupFile 2>> c:\temp\errorlog.txt

$SystemProfilebackupFile = "c:\temp\TRS-TT-SystemOpt-before_tweaks_backup_SystemProfile_$timestamp.reg"
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" $SystemProfilebackupFile 2>> c:\temp\errorlog.txt

Write-Host "Registry before backed up to $backupFile" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
Write-Host "Registry before backed up to $SystemProfilebackupFile" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Get current settings
$oldTcpAckFrequency = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpAckFrequency
$oldTCPNoDelay = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TCPNoDelay
$oldTcpDelAckTicks = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpDelAckTicks
$oldSystemResponsiveness = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile").SystemResponsiveness
$oldAutoTuningLevel = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Receive Window Auto-Tuning Level" }
$oldTimestamps = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Timestamps" }

Write-Host "Current settings:"
Write-Host "TcpAckFrequency: $oldTcpAckFrequency"
Write-Host "TCPNoDelay: $oldTCPNoDelay"
Write-Host "TcpDelAckTicks: $oldTcpDelAckTicks"
Write-Host "SystemResponsiveness: $oldSystemResponsiveness"
Write-Host "$oldAutoTuningLevel"
Write-Host "$oldTimestamps"

Read-Host "Press Enter to continue..."

# Optimize network parameters
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpAckFrequency" -Value 1
Write-Host "TcpAckFrequency set to 1" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TCPNoDelay" -Value 1
Write-Host "TCPNoDelay set to 1" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpDelAckTicks" -Value 0
Write-Host "TcpDelAckTicks set to 0" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Additional optimizations
try {
    Enable-NetAdapterRss -Name $selectedAdapterName -ErrorAction Stop
    Write-Host "Enable-NetAdapterRss executed successfully" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
} catch {
    Write-Host "Enable-NetAdapterRss is not supported on this system." | Out-File -FilePath "c:\temp\actionslog.txt" -Append
}

try {
    Enable-NetAdapterRsc -Name $selectedAdapterName -ErrorAction Stop
    Write-Host "Enable-NetAdapterRsc executed successfully" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
} catch {
    Write-Host "Enable-NetAdapterRsc is not supported on this system." | Out-File -FilePath "c:\temp\actionslog.txt" -Append
}

# Set TCP global parameters

netsh int tcp set global rss=enabled
Write-Host "Enabled TCP global rss" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

netsh int tcp set heuristics disabled
Write-Host "Disabled TCP heuristics" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

netsh winsock reset
Write-Host "Reset Winsock" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

netsh int ip reset
Write-Host "Reset IP" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

ipconfig /release
Write-Host "Released IP" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

ipconfig /renew
Write-Host "Renewed IP" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

ipconfig /flushdns
Write-Host "Flushed DNS" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Choose responsiveness level
Write-Host "Choose your responsiveness level:"
Write-Host "1. Gaming/Streaming"
Write-Host "2. Just Gaming"
Write-Host "3. File Transfer"
$choice = Read-Host

switch ($choice) {
    '1' { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 20
          Write-Host "SystemResponsiveness set to 20 for Gaming/Streaming" | Out-File -FilePath "c:\temp\actionslog.txt" -Append }
    '2' { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 10
          Write-Host "SystemResponsiveness set to 10 for Just Gaming" | Out-File -FilePath "c:\temp\actionslog.txt" -Append }
    '3' { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0
          Write-Host "SystemResponsiveness set to 0 for File Transfer" | Out-File -FilePath "c:\temp\actionslog.txt" -Append }
    default { Write-Host "Invalid choice. No changes made to SystemResponsiveness." }
}

# Adjust startup delay
cmd /c reg.exe add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayInMSec /t reg_dword /d 0x0 /f 2>> c:\temp\errorlog.txt
Write-Host "Adjusted startup delay" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Set TCP global parameters
netsh int tcp set global autotuninglevel=experimental 2>> c:\temp\errorlog.txt
Write-Host "Set TCP global autotuninglevel to experimental" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

netsh int tcp set global timestamps=enabled 2>> c:\temp\errorlog.txt
Write-Host "Enabled TCP global timestamps" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

Read-Host "Press Enter to continue..."

# Run Disk Cleanup
cleanmgr /lowdisk 2>> c:\temp\errorlog.txt
Write-Host "Ran Disk Cleanup" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Get current LSO setting
try {
    $oldLSO = Get-NetAdapterAdvancedProperty -Name $selectedAdapterName -RegistryKeyword "*LsoV2IPv4"
    Write-Host "Old LSO setting: $($oldLSO.DisplayValue)" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
} catch {
    Write-Host "Failed to get old LSO setting." | Out-File -FilePath "c:\temp\errorlog.txt" -Append
    exit
}

# Disable LSO
try {
    Set-NetAdapterAdvancedProperty -Name $selectedAdapterName -RegistryKeyword "*LsoV2IPv4" -RegistryValue 0
    Write-Host "Disabled Large Send Offload (LSO)" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
} catch {
    Write-Host "Failed to disable LSO." | Out-File -FilePath "c:\temp\errorlog.txt" -Append
    exit
}

# Get new LSO setting
try {
    $newLSO = Get-NetAdapterAdvancedProperty -Name $selectedAdapterName -RegistryKeyword "*LsoV2IPv4"
    Write-Host "New LSO setting: $($newLSO.DisplayValue)" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
} catch {
    Write-Host "Failed to get new LSO setting." | Out-File -FilePath "c:\temp\errorlog.txt" -Append
    exit
}
Write-Host "LSO Errors just mean the adaptor doesn't the setting"
Write-Host "Nothing to worry about unlike your mortality meatbag..."

# Run speed test after optimization
Write-Host "Running speed test after optimization..."
$afterSpeedTest = & $speedtestPath --format=json --accept-license --accept-gdpr | ConvertFrom-Json 2>> c:\temp\errorlog.txt
$afterDownloadMbps = [math]::Round($afterSpeedTest.download.bandwidth / 125000, 2)
$afterUploadMbps = [math]::Round($afterSpeedTest.upload.bandwidth / 125000, 2)
Write-Host "Speed test after optimization: Download $($afterDownloadMbps) Mbps, Upload $($afterUploadMbps) Mbps" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Get current settings
$newTcpAckFrequency = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpAckFrequency
$newTCPNoDelay = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TCPNoDelay
$newTcpDelAckTicks = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpDelAckTicks
$newSystemResponsiveness = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile").SystemResponsiveness
$newAutoTuningLevel = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Receive Window Auto-Tuning Level" }
$newTimestamps = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Timestamps" }


Write-Host "OLD============================================="
Write-Host "Old settings:"
Write-Host "TcpAckFrequency: $oldTcpAckFrequency"
Write-Host "TCPNoDelay: $oldTCPNoDelay"
Write-Host "TcpDelAckTicks: $oldTcpDelAckTicks"
Write-Host "SystemResponsiveness: $oldSystemResponsiveness"
Write-Host "$oldAutoTuningLevel"
Write-Host "$oldTimestamps"
Write-Host "Old LSO setting: $($oldLSO.DisplayValue)"
Write-Host "                                                  "
Write-Host "NEW==============================================="
Write-Host "New settings:"
Write-Host "TcpAckFrequency: $newTcpAckFrequency"
Write-Host "TCPNoDelay: $newTCPNoDelay"
Write-Host "TcpDelAckTicks: $newTcpDelAckTicks"
Write-Host "SystemResponsiveness: $newSystemResponsiveness"
Write-Host "$newAutoTuningLevel"
Write-Host "$newTimestamps"
Write-Host "New LSO setting: $($newLSO.DisplayValue)"

Read-Host "Press Enter to continue..."

# Kill specific tasks
taskkill /f /im firefox.exe /im chrome.exe /im iexplore.exe /im speedtest.exe /im regedit.exe 2>> c:\temp\errorlog.txt
Write-Host "Killed Firefox, Chrome, Speedtest, regedit and Internet Explorer tasks again" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

# Backup registry
$timestamp = Get-Date -Format "yyyy-MM-dd-HHmmss"
$backupFile = "c:\temp\TRS-TT-SystemOpt-after_tweaks_backup_Interfaces_$timestamp.reg"
$SystemProfilebackupFile = "c:\temp\TRS-TT-SystemOpt-after_tweaks_backup_SystemProfile_$timestamp.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" $backupFile 2>> c:\temp\errorlog.txt
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" $SystemProfilebackupFile 2>> c:\temp\errorlog.txt

Write-Host "Registry after backed up to $backupFile" | Out-File -FilePath "c:\temp\actionslog.txt" -Append
Write-Host "Registry after backed up to $SystemProfilebackupFile" | Out-File -FilePath "c:\temp\actionslog.txt" -Append

Write-Host "Optimization complete. You're welcome, genius."

# Error logging
$ErrorActionPreference = "Continue"
$Error | Out-File -FilePath "c:\temp\errorlog.txt" -Append

# Open action log and error log
# Start-Process -FilePath "c:\temp\actionslog.txt"
# Start-Process -FilePath "c:\temp\errorlog.txt"
