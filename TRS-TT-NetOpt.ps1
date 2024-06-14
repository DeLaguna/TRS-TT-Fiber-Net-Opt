# Define the local script directory
$localScriptDir = $PSScriptRoot
$ScriptFolder = $PSScriptRoot

# Define the logfile path
$Logfile = "$ScriptFolder\logfile-$timestamp.txt"

# Start Log
Start-Transcript -Path $Logfile

# Define the base URL for your GitHub repository
$TRSUsername = "https://raw.githubusercontent.com/DeLaguna/"
$TRSRepo = "TRS-TT-Fiber-NetOpt/"
$GitHubBase = $TRSUsername + $TRSRepo

# Define a list of script names
$scriptNames = @("Kill-Process.ps1", 
                 "Run-SpeedTest.ps1", 
                 "Backup-Registry.ps1", 
                 "Insults.ps1", 
                 "UserPrompt.ps1",
                 "Optimize-NetworkSettings.ps1",
                 "Set-TCPGlobalParameters.ps1",
                 "Get-CurrentSettings.ps1",
                 "AdditionalOptimizations.ps1",
                 "Adjust-StartupDelay.ps1",
                 "Run-DiskCleanup",
                 "Compare-Settings",
                 "",
                 ""
                 )



# Loop through the list and load each script
foreach ($scriptName in $scriptNames) {
    $localScriptPath = Join-Path -Path $localScriptDir -ChildPath $scriptName

    if (Test-Path -Path $localScriptPath) {
        # If the local script exists, ask the user whether they want to use it
        $response = UserPrompt -Message "Local copy of $scriptName found. Do you want to use it?" -Title "Local Script Found"

        if ($response -eq "Yes") {
            # If the user chooses to use the local script, load it
            . $localScriptPath
        } else {
            # If the user chooses not to use the local script, download and load the remote script
            Invoke-Expression (Invoke-RestMethod ($GitHubBase + $scriptName))
        }
    } else {
        # If the local script does not exist, download and load the remote script
        Invoke-Expression (Invoke-RestMethod ($GitHubBase + $scriptName))
    }
}

# Ask the user if they wish to create a restore point using a Windows form
$response = UserPrompt -Message "Do you wish to Create a Restore point?" -Title "Restore Point Prompt"

if ($response -eq "Yes") {
    # Create a system restore point
    $description = "Restore point before running TheRealSarcasmO's amazing optimization script"
    Checkpoint-Computer -Description $description -RestorePointType "MODIFY_SETTINGS"
    Write-Host "Oh and Meatbag I Created a system restore point: $description" -ForegroundColor Green
}

# Pause to insult user
InsultUserNpause

Get-CurrentSettings

# Now you can call these functions in your script
Kill-Processes -ProcessNames ("Firefox", "Chrome", "Edge","Speedtest","regedit","Internet Explorer")
Run-SpeedTest -TestTime 'Before'
Backup-Registry -Status "Before"

# Get a random insult and print it
$randomInsult = InsultUser
Write-Host $randomInsult

# Call the function in your script
Optimize-NetworkSettings

AdditionalOptimizations
 
Set-TCPGlobalParameters

Adjust-StartupDelay

Run-DiskCleanup

# Compare old and new settings
Compare-Settings

# Pause to insult user
InsultUserNpause

# Run speed test after optimization
Run-SpeedTest -TestTime 'After'

# Get current settings
$newTcpAckFrequency = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpAckFrequency
$newTCPNoDelay = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TCPNoDelay
$newTcpDelAckTicks = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpDelAckTicks
$newSystemResponsiveness = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile").SystemResponsiveness
$newAutoTuningLevel = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Receive Window Auto-Tuning Level" }
$newTimestamps = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Timestamps" }

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host "Settings Comparison:"
Write-Output "TcpAckFrequency:      Old: $oldTcpAckFrequency                                                                      New: $newTcpAckFrequency"
Write-Output "TCPNoDelay:           Old: $oldTCPNoDelay                                                                      New: $newTCPNoDelay"
Write-Output "TcpDelAckTicks:       Old: $oldTcpDelAckTicks                                                                      New: $newTcpDelAckTicks"
Write-Output "SystemResponsiveness: Old: $oldSystemResponsiveness                                                                     New: $newSystemResponsiveness"

#EOS