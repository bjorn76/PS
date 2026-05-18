# Define where you want to save the log file
$LogFile = "C:\Users\bjorn\Documents\bjorn76\PS\power\BatteryLog.txt"

# Create the file with a tab-separated header if it doesn't exist yet
if (-not (Test-Path $LogFile)) {
    "Timestamp`tBattery_SOC" | Out-File -FilePath $LogFile -Encoding utf8
}

# Fetch the battery status using CIM (modern WMI)
$Battery = Get-CimInstance -ClassName Win32_Battery

if ($Battery) {
    # Get percentage and current date/time
    $SOC = $Battery.EstimatedChargeRemaining
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Create the tab-separated line (`t represents a tab in PowerShell)
    $LogLine = "$Timestamp`t$SOC%"
    
    # Append the data to the text file
    Add-Content -Path $LogFile -Value $LogLine
} else {
    Write-Warning "No battery detected on this system."
}