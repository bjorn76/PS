# Path to the script you saved in Step 1
$ScriptPath = "C:\Users\bjorn\Documents\bjorn76\PS\power\Log-BatterySOC.ps1"

# Define what the task does (runs PowerShell silently in the background)
$Action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-NoProfile -WindowStyle Hidden -File `"$ScriptPath`""

# Define the trigger (Starts now, repeats every 15 minutes indefinitely)
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 15)

# Ensure the task runs even if the laptop is unplugged/on battery power
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

# Register the task into Windows
Register-ScheduledTask -TaskName "MonitorBatterySOC" -Action $Action -Trigger $Trigger -Settings $Settings -Force