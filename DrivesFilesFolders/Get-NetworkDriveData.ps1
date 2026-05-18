#Find network mapped drives
cls
$t = Get-Date -Format yyyy-MM-dd_HHmm
$t
$NetDrives = Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '4'" | Select-Object -Property DeviceID,ProviderName,Size,Freespace
$NetDrives | Export-Csv -path "c:\NetworkDrive_$t.csv"

Import-Csv -path "c:\NetworkDrive_$t.csv"
#$NetDrives  | Format-table -Property DeviceID, ProviderName,Size,Freespace


