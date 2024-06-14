function Set-LSOSettings {
    param (
        [Parameter(Mandatory=$true)]
        [string]$selectedAdapterName
    )

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
}