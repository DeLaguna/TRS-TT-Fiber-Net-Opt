function Kill-Processes {
    param (
        [Parameter(Mandatory=$true)]
        [string[]]$ProcessNames
    )

    foreach ($ProcessName in $ProcessNames) {
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
}