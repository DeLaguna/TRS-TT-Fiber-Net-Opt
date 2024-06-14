# irm https://raw.githubusercontent.com/DeLaguna/TRS-TT-NetOpt/TRS-TT-NetOpt.ps1 | iex
# TheRealSarcasmO's Ultimate Windows 11 Optimization Script
# If you're smart enough to use this, we salute you. If not, well, good luck meatbag.
# Enjoy reading my code.maybe you will like my other creations http://linktr.ee/TheRealSarcasmO

# Define an array of insults
$insults = @(
"In the words of Shakespeare, 'Thou art a boil, a plague sore, an embossed carbuncle in my corrupted blood, meatbag...'",
"As Winston Churchill once said, 'I may be drunk, Miss, but in the morning I will be sober and you will still be a meatbag...'",
"Oscar Wilde might say, 'Some cause happiness wherever they go; others, whenever they go. You, meatbag, are firmly in the second category...'",
"According to Mark Twain, 'I didn't attend the funeral, but I sent a nice letter saying I approved of it.' That's how I feel about your code, meatbag...",
"As Dorothy Parker once said, 'You can lead a horticulture, but you can't make her think.' The same applies to you, meatbag...",
"In the words of Groucho Marx, 'I've had a perfectly wonderful evening, but this wasn't it.' That's how I feel about our coding session, meatbag...",
"As Mae West might say, 'When I'm good, I'm very good, but when I'm bad, I'm better.' You, meatbag, are neither...",
"According to Albert Einstein, 'Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.' You're proof of that, meatbag...",
"In the words of Winston Churchill, 'You have all the virtues I dislike and none of the vices I admire.' That sums you up, meatbag...",
"As Margaret Thatcher once said, 'If you want something said, ask a man; if you want something done, ask a woman.' If you want nothing at all, ask a meatbag...",
"According to Mark Twain, 'Suppose you were an idiot, and suppose you were a member of Congress; but I repeat myself.' The same could be said for you, meatbag...",
"In the words of Oscar Wilde, 'True friends stab you in the front.' But you, meatbag, wouldn't know the first thing about truth...",
"As Groucho Marx might say, 'I never forget a face, but in your case I'll be glad to make an exception.' That's how I feel about your code, meatbag...",
"According to Dorothy Parker, 'This is not a novel to be tossed aside lightly. It should be thrown with great force.' Much like your code, meatbag...",
"In the words of Mae West, 'Between two evils, I always pick the one I never tried before.' But you, meatbag, are a whole new level of evil...",
"As Albert Einstein once said, 'Only two things are infinite, the universe and human stupidity, and I'm not sure about the former.' You're a testament to that, meatbag...",
"According to Winston Churchill, 'A lie gets halfway around the world before the truth has a chance to get its pants on.' Your code, meatbag, is that lie...",
"In the words of Mark Twain, 'Get your facts first, then you can distort them as you please.' But you, meatbag, wouldn't know a fact if it hit you in the face...",
"As Oscar Wilde might say, 'I am so clever that sometimes I don't understand a single word of what I am saying.' You, meatbag, are the opposite...",
"According to Groucho Marx, 'Those are my principles, and if you don't like them... well, I have others.' But you, meatbag, wouldn't know a principle if it bit you...",
"In the words of Dorothy Parker, 'The first thing I do in the morning is brush my teeth and sharpen my tongue.' You, meatbag, should try it sometime...",
"As Mae West once said, 'When choosing between two evils, I always like to try the one I've never tried before.' But you, meatbag, are an evil I'd rather avoid...",
"According to Albert Einstein, 'The difference between stupidity and genius is that genius has its limits.' You, meatbag, are limitless...",
"In the words of Winston Churchill, 'I may be drunk, Miss, but in the morning I will be sober and you will still be ugly.' In your case, meatbag, you'll still be clueless...",
"As Mark Twain might say, 'Go to Heaven for the climate, Hell for the company.' You, meatbag, would be the exception...",
"According to Oscar Wilde, 'I can resist everything except temptation.' But you, meatbag, are no temptation...",
"In the words of Groucho Marx, 'I find television very educating. Every time somebody turns on the set, I go into the other room and read a book.' You, meatbag, are the television...",
"As Dorothy Parker once said, 'Beauty is only skin deep, but ugly goes clean to the bone.' You, meatbag, are bone deep...",
"According to Mae West, 'You only live once, but if you do it right, once is enough.' But you, meatbag, are doing it all wrong...",
"In the words of Albert Einstein, 'Education is what remains after one has forgotten what one has learned in school.' You, meatbag, have forgotten everything...",
"As Winston Churchill might say, 'My most brilliant achievement was my ability to be able to persuade my wife to marry me.' Your code, meatbag, is no achievement...",
"According to Mark Twain, 'It's not the size of the dog in the fight, it's the size of the fight in the dog.' You, meatbag, have no fight...",
"In the words of Oscar Wilde, 'Experience is simply the name we give our mistakes.' You, meatbag, are full of experience...",
"As Groucho Marx once said, 'I've had a perfectly wonderful evening, but this wasn't it.' That's how I feel about our coding session, meatbag...",
"According to Dorothy Parker, 'If you want to know what God thinks of money, just look at the people he gave it to.' If you want to know what I think of you, meatbag, just look at your code...",
"In the words of Mae West, 'I used to be Snow White, but I drifted.' You, meatbag, have drifted off course...",
"As Albert Einstein might say, 'The only source of knowledge is experience.' You, meatbag, are sorely lacking...",
"According to Winston Churchill, 'Success is not final, failure is not fatal: It is the courage to continue that counts.' You, meatbag, lack courage...",
"In the words of Mark Twain, 'The secret of getting ahead is getting started.' You, meatbag, are stuck in place...",
"As Oscar Wilde once said, 'Be yourself; everyone else is already taken.' But you, meatbag, should try being someone else...",
"According to Groucho Marx, 'I refuse to join any club that would have me as a member.' I feel the same about your code, meatbag...",
"In the words of Dorothy Parker, 'If you have any young friends who aspire to become writers, the second greatest favor you can do them is to present them with copies of The Elements of Style. The first greatest, of course, is to shoot them now, while they’re happy.' You, meatbag, could use both...",
"As Mae West might say, 'I'll try anything once, twice if I like it, three times to make sure.' But your code, meatbag, I wouldn't try even once...",
"According to Albert Einstein, 'Imagination is more important than knowledge.' You, meatbag, lack both...",
"In the words of Winston Churchill, 'We make a living by what we get, but we make a life by what we give.' You, meatbag, have given nothing but trouble...",
"As Mark Twain once said, 'The man who does not read has no advantage over the man who cannot read.' You, meatbag, have no advantage...",
"According to Oscar Wilde, 'Always forgive your enemies; nothing annoys them so much.' But you, meatbag, are beyond forgiveness...",
"In the words of Groucho Marx, 'Behind every successful man is a woman, behind her is his wife.' Behind every failed code, meatbag, is you...only you..."
)
$timestamp = Get-Date -Format "yyyy-MM-dd-HHmmss"
$tempFolder = "C:\temp"
$ScriptFolder = "C:\Users\DeLag\Google Drive Streaming\My Drive\DTT\Game Tools\TRS-TT-Fiber-Net-Opt"
$Logfile = "$tempFolder\TRS-TT-Fiber-Net-Opt-Log-$timestamp.txt"

# Set execution policy
Set-ExecutionPolicy Unrestricted -Force 

# Start Log
Start-Transcript -Path $Logfile

Write-Host "Logging started Started: " $Logfile

function Backup-Registry {
    # usage = Backup-Registry -Status "Before"
    # usage = Backup-Registry -Status "After"
    param (
        [Parameter(Mandatory=$true)]
        [string]$Status
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd-HHmmss"
    $tempFolder = "C:\temp"

    Write-Host "==============================================================================="
    $backupFile = "$tempFolder\TRS-TT-NetOpt-$Status-tweaks-backup-Interfaces-$timestamp.reg" 
    Write-Host "Backing up $backupFile..." -ForegroundColor Yellow
    reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" $backupFile 
    if (Test-Path $backupFile) {
        Write-Host "Backup completed for HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -ForegroundColor Green
    } else {
        Write-Host "Backup file not found. Check the file path and permissions." -ForegroundColor Red
    }

    Write-Host "==============================================================================="
    $SystemProfileBackupFile = "$tempFolder\TRS-TT-NetOpt-$Status-tweaks-backup-SystemProfile-$timestamp.reg" 
    Write-Host "Backing up $SystemProfileBackupFile..." -ForegroundColor Yellow
    reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" $SystemProfileBackupFile
    if (Test-Path $SystemProfileBackupFile) {
        Write-Host "Backup completed for HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -ForegroundColor Green
    } else {
        Write-Host "Backup file not found. Check the file path and permissions." -ForegroundColor Red
    }

    Write-Host "==============================================================================="
    $DeLayedStartBackupFile = "$tempFolder\TRS-TT-NetOpt-$Status-tweaks-backup-DeLayedStart-$timestamp.reg"  
    Write-Host "Backing up $DeLayedStartBackupFile..." -ForegroundColor Yellow
    reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" $DeLayedStartBackupFile
    if (Test-Path $DeLayedStartBackupFile) {
        Write-Host "Backup completed for HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -ForegroundColor Green
    } else {
        Write-Host "Backup file not found. Check the file path and permissions." -ForegroundColor Red
    }

    Write-Host "==============================================================================="
}

function InsultUserNpause {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$insults
    )

    # Get a random insult from the array
    $randomInsult = Get-Random -InputObject $insults
    # Output the random insult and prompt the user to continue
    Write-Host " "
    Write-Host "$randomInsult..." -ForegroundColor Cyan
    Write-Host " "
    Start-Sleep -Seconds 5
}

# Get Random Insult as Variable to put in text to meatbag.
function InsultUser {
 #InsultUser -insults $insults # $randomInsult
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$insults
    )

    # Get a random insult from the array
    $randomInsult = Get-Random -InputObject $insults
}

function Kill-Process {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ProcessName
    )

    # Get the process
    $process = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

    if ($process) {
        # If the process is running, kill it
        $process | Stop-Process -Force

        Write-Host "**$ProcessName** was running and has been killed." -ForegroundColor Green
    } else {
        # If the process is not running, print a message
        Write-Host "**$ProcessName** was not running."
    }
}

Write-Host "Welcome to TheRealSarcasmO's Ultimate Windows 11 Optimization Script. Do you wish to continue? (y/n)"
$answer = Read-Host
if ($answer -ne 'y') {
    InsultUser -insults $insults
    Write-Host "Well, aren't we a scaredy cat? $randomInsult Goodbye, meatbag!"
    Start-Sleep -Seconds 15
    exit
}


Write-Host "Oh, a brave soul we have here. Let’s get started, shall we?" -ForegroundColor Green
Kill-Process -ProcessName "Firefox" 
Kill-Process -ProcessName "Speedtest"
Kill-Process -ProcessName "regedit"
Kill-Process -ProcessName "Internet Explorer"
Kill-Process -ProcessName "Edge"

# Check if System Restore is enabled
$sysRestore = Get-ComputerRestorePoint
if (-not $sysRestore) {
    InsultUser -insults $insults # $randomInsult
    Write-Host "$randomInsult - System Restore is not enabled on this system."
    Write-Host "Enable SystemRestore it and rerun this file as an Administrator."
    exit
}
Write-Host "Do you wish to Create a Restore point? (y/n)"
$answer = Read-Host

if ($answer -eq 'y') {
    # Create a system restore point
    $description = "Restore point before running TheRealSarcasmO's amazing optimization script"
    Checkpoint-Computer -Description $description -RestorePointType "MODIFY_SETTINGS"
    Write-Host "Oh and Meatbag I Created a system restore point: $description" -ForegroundColor Green
}

# Pause to insult user
InsultUserNpause -insults $insults

# Kill specific tasks
Kill-Process -ProcessName "Firefox" 
Kill-Process -ProcessName "Speedtest"
Kill-Process -ProcessName "Internet Explorer"
Kill-Process -ProcessName "Edge"
Kill-Process -ProcessName "regedit"

$Status = "After Tasks Killed"

# Backup Registry
Backup-Registry -Status "Before"

# Get network adapters
$adapters = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object { $_.NetConnectionStatus -eq 2 } | Select-Object -Property Name, NetConnectionStatus

$adapterConfirmed = $false
while (-not $adapterConfirmed) {
    Write-Host "Please select a network adapter from the list below:" -ForegroundColor Yellow

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
$Status = "Adapter Picked"
Write-Host ""
# Check if speedtest.exe exists
$speedtestPath = "$tempFolder\speedtest.exe"
if (!(Test-Path -Path $speedtestPath)) {
    Write-Host "Downloading speedtest.exe..."
    Invoke-WebRequest -Uri "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip" -OutFile "$tempFolder\speedtest.zip" 
    Expand-Archive -Path "$tempFolder\speedtest.zip" -DestinationPath "$tempFolder" 
    Remove-Item -Path "$tempFolder\speedtest.zip" 
}
$Status = "Speed Test Installed"

function Run-SpeedTest {
    # Run-SpeedTest -TestTime 'Before'
    # Run-SpeedTest -TestTime 'After'
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet('Before','After')]
        [string]$TestTime
    )

    # Define the path to the speedtest CLI
    $speedtestPath = "Path\to\your\speedtest\cli"

    Write-Host "Running speed test $TestTime optimization..." -ForegroundColor Yellow

    # Run the speed test
    $speedTest = & $speedtestPath --format=json --accept-license --accept-gdpr | ConvertFrom-Json 

    # Calculate the download and upload speeds in Mbps
    $downloadMbps = [math]::Round($speedTest.download.bandwidth / 125000, 2)
    $uploadMbps = [math]::Round($speedTest.upload.bandwidth / 125000, 2)

    # Get the jitter and ping values
    $jitter = $speedTest.ping.jitter
    $ping = $speedTest.ping.latency

    # Output the results in a cool way
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "Speed test $TestTime optimization:" -ForegroundColor Cyan
    Write-Host "Download: $($downloadMbps) Mbps" -ForegroundColor Red
    Write-Host "Upload: $($uploadMbps) Mbps" -ForegroundColor Red
    Write-Host "Ping: $($ping) ms" -ForegroundColor Red
    Write-Host "Jitter: $($jitter) ms" -ForegroundColor Red
    Write-Host "===============================================" -ForegroundColor Cyan
}

# Run speed test before optimization
Run-SpeedTest -TestTime 'Before'

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

# Pause to insult user
InsultUserNpause -insults $insults

# Optimize network parameters
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpAckFrequency" -Value 1
Write-Host "TcpAckFrequency set to 1" 

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TCPNoDelay" -Value 1
Write-Host "TCPNoDelay set to 1" 

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpDelAckTicks" -Value 0
Write-Host "TcpDelAckTicks set to 0" 
$Status = "After Optimize network parameters"

# Additional Optimizations
Enable-NetAdapterRsc  -Verbose
try {
    Enable-NetAdapterRss -Name $selectedAdapterName -ErrorAction Stop
    Write-Host "Enable-NetAdapterRss executed successfully" -ForegroundColor Green
} catch {
    Write-Host "Enable-NetAdapterRss is not supported on this system." -ForegroundColor Red
}

try {
    Enable-NetAdapterRsc -Name $selectedAdapterName -ErrorAction Stop
    Write-Host "Enable-NetAdapterRsc executed successfully" -ForegroundColor Green
} catch {
    Write-Host "Enable-NetAdapterRsc is not supported on this system." -ForegroundColor Red
}
$Status = "After Additional Optimizations"
# Set TCP global parameters

netsh int tcp set global rss=enabled
Write-Host "Enabled TCP global rss" 


Set-NetTCPSetting -SettingName InternetCustom -ScalingHeuristics Disabled
netsh int tcp set heuristics disabled
Write-Host "Disabled TCP heuristics" 

netsh int tcp set global autotuninglevel=experimental 
Write-Host "Set TCP global autotuninglevel to experimental" 

netsh int tcp set global timestamps=enabled 
Write-Host "Enabled TCP global timestamps" 

netsh winsock reset
Write-Host "Reset Winsock" 

netsh int ip reset
Write-Host "Reset IP" 

ipconfig /release
Write-Host "Released IP" 

ipconfig /renew
Write-Host "Renewed IP" 

ipconfig /flushdns
Write-Host "Flushed DNS" 
Write-Host ""

$Status = "After Set TCP global parameters"

# Choose responsiveness and Throughput tweaks
Write-Host "Choose your responsiveness level:" -ForegroundColor Yellow
Write-Host "1. Gaming/Streaming" 
Write-Host "2. General Use"
Write-Host "3. File Transfer"
$choice = Read-Host

switch ($choice) {
    '1' { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0
          Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value ffffffff
          Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargeSystemCache" -Value 0
          Write-Host "SystemResponsiveness and Throttling set to Max for Gaming/Streaming"  }
    '2' { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 10
          Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 20
          Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargeSystemCache" -Value 1

          Write-Host "SystemResponsiveness and Throttling set to Balanced for Just Gaming"  }
    '3' { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 20
          Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 30
          Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargeSystemCache" -Value 1
          Write-Host "SystemResponsiveness and Throttling set to  for File Transfer"  }
    default { Write-Host "Invalid choice. No changes made to SystemResponsiveness." }
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "LargeSystemCache" -Value 0
#thoughts for future - Set-NetAdapterPowerManagement -ArpOffload Disabled -D0PacketCoalescing Enabled -DeviceSleepOnDisconnect Enabled -SelectiveSuspend Enabled -WakeOnMagicPacket Enabled -WakeOnPattern Enabled

$Status = "After Set responsiveness level"

# Adjust startup delay
cmd /c reg.exe add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayInMSec /t reg_dword /d 0x0 /f 
Write-Host "Adjusted startup delay" 

$Status = "After Adjust startup delay"

# Pause to insult user
InsultUserNpause -insults $insults

# Run Disk Cleanup
cleanmgr /lowdisk 
Write-Host "Opened Disk Cleanup for Meatbag to do..." 

$Status = "After CleanDisk"

# Get current LSO setting
$oldLSO = "N/A"
try {
    $oldLSO = Get-NetAdapterAdvancedProperty -Name $selectedAdapterName -RegistryKeyword "*LsoV2IPv4"
    Write-Host "Old LSO setting: $($oldLSO.DisplayValue)" 
} catch {
    Write-Host "Failed to get old LSO setting." 
}

# Disable LSO
try {
    Set-NetAdapterAdvancedProperty -Name $selectedAdapterName -RegistryKeyword "*LsoV2IPv4" -RegistryValue 0
    Write-Host "Disabled Large Send Offload (LSO)" 
} catch {
    Write-Host "Failed to disable LSO."
}

# Get new LSO setting
$newLSO = "N/A"
try {
    $newLSO = Get-NetAdapterAdvancedProperty -Name $selectedAdapterName -RegistryKeyword "*LsoV2IPv4"
    Write-Host "New LSO setting: $($newLSO.DisplayValue)" 
} catch {
    Write-Host "Failed to get new LSO setting." 
}

Write-Host "LSO Errors just mean the adaptor doesn't need the setting" -ForegroundColor Red

# Pause to insult user
InsultUserNpause -insults $insults

# Run speed test after optimization
Run-SpeedTest -TestTime 'After'

$Status = "After Speed Test"

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
Write-Output "AutoTuningLevel:      Old: $oldAutoTuningLevel                    New: $newAutoTuningLevel"
Write-Output "Timestamps:           Old: $oldTimestamps                         New: $newTimestamps"
Write-Output "LSO setting:          Old: $oldLSO                                                                     New: $newLSO"
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Approximate speeds may not be different if tested with browser" -ForegroundColor Yellow
Write-Host "Take with a boulder of salt, stop tripping meatbag heres the data!" -ForegroundColor Yellow

# Display the results side by side
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "Speed Test Results Comparison:" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "Metric                 Before Optimization     After Optimization" -ForegroundColor Cyan
Write-Host "------                 ------------------     -----------------" -ForegroundColor Cyan
Write-Host "Download (Mbps):       $beforeDownloadMbps               $afterDownloadMbps" -ForegroundColor Red
Write-Host "Upload (Mbps):         $beforeUploadMbps                 $afterUploadMbps" -ForegroundColor Red
Write-Host "Ping (ms):             $beforePing                       $afterPing" -ForegroundColor Red
Write-Host "Jitter (ms):           $beforeJitter                     $afterJitter" -ForegroundColor Red
Write-Host "===============================================" -ForegroundColor Cyan

# Pause to insult user
InsultUserNpause -insults $insults

# Kill specific tasks
Kill-Process -ProcessName "Firefox" 
Kill-Process -ProcessName "Speedtest"
Kill-Process -ProcessName "regedit"
Kill-Process -ProcessName "Internet Explorer"
Kill-Process -ProcessName "Edge"
Write-Host ""

# Backup Registry
Backup-Registry -Status "After"
Write-Host ""
Write-Host "Optimization complete. You're welcome, till Next time meatbag." -ForegroundColor Yellow
# Open action log and error log
# Start-Process -FilePath "$tempFolder\Actionslog.txt"
# Start-Process -FilePath "$tempFolder\errorlog.txt"

# Stop Logging
Write-Host "Closing in 30 seconds"
Start-Sleep -Seconds 10
Write-Host "Closing in 20 seconds"
Start-Sleep -Seconds 10
Write-Host "Closing in 10 seconds"
Write-Host "Full effect of Optimization willl be in effect after you reboot" -ForegroundColor Red
Start-Sleep -Seconds 10

# Display a message box to the user
Add-Type -TypeDefinition @"
    using System;
    using System.Windows.Forms;
    public class MessageBox {
        public static void Show(string message, string title) {
            MessageBox.Show(message, title, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
        }
    }
"@

InsultUser -insults $insults # $randomInsult

# Call the message box function
$response = [MessageBox]::Show("Do you want to restart now and be awesome, or pretend to restart later and be a terrible meatbag?", "Restart Prompt")

# Check the response
if ($response -eq "Yes") {
    # User chose to restart now
    Write-Host "You are smarter than you loook meatbag, Restarting now...in 3 seconds"
    Start-Sleep -Seconds 3
    Restart-Computer -Force
} else {
    # User chose to restart later
    Write-Host "$randomInsult - You've chosen to restart later. Don't forget!"
    Start-Sleep -Seconds 20
}
Stop-Transcript
#eos