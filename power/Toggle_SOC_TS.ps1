# Define the task name
$TaskName = "MonitorBatterySOC"

# Retrieve the task to check its state
$Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($Task) {
    # Check current state and toggle
    if ($Task.State -eq "Ready" -or $Task.State -eq "Running") {
        Disable-ScheduledTask -TaskName $TaskName | Out-Null
        Write-Host "Task '$TaskName' is now PAUSED (Disabled)." -ForegroundColor Yellow
    } else {
        Enable-ScheduledTask -TaskName $TaskName | Out-Null
        Write-Host "Task '$TaskName' is now RESUMED (Enabled)." -ForegroundColor Green
    }
} else {
    Write-Warning "Task '$TaskName' was not found. Please check the spelling or path."
}