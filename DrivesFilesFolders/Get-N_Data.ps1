#Log Freespace of a network drive

cls
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"


# Opens explorer to init drive
# explorer N:


# Get all drives
$NetDrives = Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '4'" 

# Filter out N: and add date to table
$Ndrive = $NetDrives | where { $_.DeviceID -eq 'N:'} | Select-Object @{l='Date';e={$date}}, DeviceID, ProviderName,Size,Freespace
#$Ntable = $Ndrive | Format-table -Property Date, DeviceID, ProviderName,Size,Freespace


# Determine script location for PowerShell
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path
#Write-Host "Current script directory is $ScriptDir" #Debug
$filename = $ScriptDir + "\Get-N-Data.csv"


#$Ndrive | Format-table -Property Date, DeviceID, ProviderName,Size,Freespace #Debug

$Ndrive | Export-Csv -path $filename -append


Import-Csv -path $filename | Format-table -Property Date, DeviceID, ProviderName,Size,Freespace




