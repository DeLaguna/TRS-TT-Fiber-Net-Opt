function AdditionalOptimizations {
    param (
        [Parameter(Mandatory=$true)]
        [string]$selectedAdapterName
    )

    # Additional Optimizations
    Enable-NetAdapterRsc -Name $selectedAdapterName -Verbose
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