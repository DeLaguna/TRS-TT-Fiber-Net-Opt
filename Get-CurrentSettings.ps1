function Get-CurrentSettings {
    # Get current settings
    $oldTcpAckFrequency = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpAckFrequency
    $oldTCPNoDelay = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TCPNoDelay
    $oldTcpDelAckTicks = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces").TcpDelAckTicks
    $oldSystemResponsiveness = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile").SystemResponsiveness
    $oldAutoTuningLevel = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Receive Window Auto-Tuning Level" }
    $oldTimestamps = (netsh int tcp show global).Split("`n") | Where-Object { $_ -match "Timestamps" }

    # Print current settings
    Write-Host "Current settings:"
    Write-Host "TcpAckFrequency: $oldTcpAckFrequency"
    Write-Host "TCPNoDelay: $oldTCPNoDelay"
    Write-Host "TcpDelAckTicks: $oldTcpDelAckTicks"
    Write-Host "SystemResponsiveness: $oldSystemResponsiveness"
    Write-Host "$oldAutoTuningLevel"
    Write-Host "$oldTimestamps"
}