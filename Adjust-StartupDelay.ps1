function Adjust-StartupDelay {
    # Adjust startup delay
    cmd /c reg.exe add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize /v StartupDelayInMSec /t reg_dword /d 0x0 /f 
    Write-Host "Adjusted startup delay" 
}