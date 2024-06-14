function Run-DiskCleanup {
    # Run Disk Cleanup
    cleanmgr /lowdisk 
    Write-Host "Opened Disk Cleanup for Meatbag to do..." 
}