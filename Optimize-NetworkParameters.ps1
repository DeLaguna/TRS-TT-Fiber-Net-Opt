function Optimize-NetworkParameters {
    # Optimize network parameters
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpAckFrequency" -Value 1
    Write-Host "TcpAckFrequency set to 1" 

    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TCPNoDelay" -Value 1
    Write-Host "TCPNoDelay set to 1" 

    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpDelAckTicks" -Value 0
    Write-Host "TcpDelAckTicks set to 0" 
}