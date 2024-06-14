function Run-SpeedTest {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet('Before','After')]
        [string]$TestTime
    )

    # Define the path to the speedtest CLI
    $speedtestPath = "$ScriptFolder\speedtest\cli"

    # Check if the speedtest CLI exists
    if (!(Test-Path -Path $speedtestPath)) {
        # If the speedtest CLI does not exist, download it
        $speedtestUrl = "https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-win64.zip"
        $speedtestZipPath = "$ScriptFolder\speedtest\cli.zip"
        Invoke-WebRequest -Uri $speedtestUrl -OutFile $speedtestZipPath

        # Extract the downloaded zip file
        Expand-Archive -Path $speedtestZipPath -DestinationPath $ScriptFolder\speedtest

        # Remove the downloaded zip file
        Remove-Item -Path $speedtestZipPath
    }

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