# Start Log
Start-Transcript -Path $Logfile

# Set execution policy
Set-ExecutionPolicy Unrestricted -Force 

$ScriptFolder = $PSScriptRoot

# Define the base URL for your GitHub repository
$TRSUsername = "https://raw.githubusercontent.com/DeLaguna/"
$TRSRepo = "TRS-TT-Fiber-NetOpt/"
$GitHubBase = $TRSUsername + $TRSRepo

# Define a list of script names
$scriptNames = @("Kill-Process.ps1", "Run-SpeedTest.ps1", "Backup-Registry.ps1", "Insults.ps1", "UserPrompt.ps1","Optimize-NetworkSettings.ps1","Set-TCPGlobalParameters.ps1","Set-LSOSettings.ps1")

# Define the local script directory
$localScriptDir = $PSScriptRoot

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

# Load the UserPrompt function from your GitHub repository
Invoke-Expression (Invoke-RestMethod ($GitHubBase + "UserPrompt.ps1"))

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

# Ask the user a question using a Windows form and print the response
# $response = UserPrompt -Message "Do you want to restart now?" -Title "Restart Prompt"
# Write-Host $response

# Call the function in your script
Optimize-NetworkSettings

AdditionalOptimizations
 
Set-TCPGlobalParameters

Set-LSOSettings

Adjust-StartupDelay

Run-DiskCleanup
