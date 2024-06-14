function Set-TCPGlobalParameters {
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