# Define the task name
$TaskName = "MonitorBatterySOC"

# 1. Fetch the task
$Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($Task) {
    # 2. Get the current repetition interval from the first trigger
    # Task Scheduler stores this as an ISO 8601 duration string (e.g., "PT1M" or "PT5M")
    $CurrentInterval = $Task.Triggers[0].Repetition.Interval

    # 3. Determine the new interval based on the current state
    if ($CurrentInterval -eq "PT1M") {
        $NewInterval = [TimeSpan]::FromMinutes(5)
        $Message = "Task '$TaskName' interval toggled to: 5 MINUTES"
        $Color = "Yellow"
    } else {
        # Defaults to 1 minute if it's currently 5 mins, or set to something else entirely
        $NewInterval = [TimeSpan]::FromMinutes(1)
        $Message = "Task '$TaskName' interval toggled to: 1 MINUTE"
        $Color = "Green"
    }

    # 4. Create a copy of the existing trigger but update the repetition interval
    $UpdatedTrigger = $Task.Triggers[0]
    $UpdatedTrigger.Repetition.Interval = $NewInterval

    # 5. Apply the change back to the scheduled task
    #Set-ScheduledTask -TaskName $TaskName -Trigger $UpdatedTrigger | Out-Null
    
    Write-Host $Message -ForegroundColor $Color
} else {
    Write-Warning "Task '$TaskName' was not found. Please check the spelling or path."
}