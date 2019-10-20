cls
write-host -NoNewline -ForegroundColor Cyan "Start of InstalledSW_x86: "
Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-output ""

write-host -NoNewline -ForegroundColor Cyan "User: "
$env:USERNAME

write-host -ForegroundColor Cyan "Installed x86 Software: "
$ListOfSW = Get-ItemProperty "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object -property DisplayName, Displayversion, installdate
$FoundSW = $ListOfSW -match ""
$FoundSW | Format-Table
Write-output ""

write-host -NoNewline -ForegroundColor Cyan "End of InstalledSW_x86: "
Get-Date -format "yyyy-MM-dd HH:mm:ss"
