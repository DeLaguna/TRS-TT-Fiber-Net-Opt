# Define all your functions in separate scripts and host them on GitHub
# For example, you might have a script for each function like Kill-Process.ps1, Run-SpeedTest.ps1, Backup-Registry.ps1, etc.

# In your main script, you can dynamically load these scripts from GitHub using the Invoke-Expression (iex) cmdlet
$TRSUsername = "https://raw.githubusercontent.com/DeLaguna/"
$TRSRepo = "TRS-TT-Fiber-NetOpt"
$GitHubBase= $TRSUsername+$TRSRepo

irm $GitHubBase/Kill-Process.ps1 | iex
irm $GitHubBase/Run-SpeedTest.ps1 | iex
irm $GitHubBase/Backup-Registry.ps1 | iex
irm $GitHubBase/Insults.ps1 | iex
# ...

# Now you can call these functions in your script
# Kill-Process -ProcessName "Firefox"
# Run-SpeedTest -TestTime 'Before'
# Backup-Registry -Status "Before"
# ...

# For network settings that allow greater than Gigabit transfers, you might need to adjust some parameters
# Here's an example of how you might do this:

function Optimize-NetworkSettings {
    # Adjust the TCP/IP settings for greater than Gigabit transfers
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpWindowSize" -Value 65536
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "Tcp1323Opts" -Value 3
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Value 64
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnablePMTUBHDetect" -Value 0
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnablePMTUDiscovery" -Value 1
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "GlobalMaxTcpWindowSize" -Value 16777216
}

# Don't forget to host this function on GitHub and load it in your main script
# irm https://raw.githubusercontent.com/YourGitHubUsername/YourRepo/Optimize-NetworkSettings.ps1 | iex

# Call the function in your script
# Optimize-NetworkSettings

# InsultUserNpause
# $randomInsult = InsultUser

This is just a basic example. Depending on your specific needs, you might need to adjust the parameters or add more functions. Also, please replace YourGitHubUsername and YourRepo with your actual GitHub username and repository name.

Remember to test your scripts in a safe environment before running them on your main system. Let me know if you need further assistance! 😊