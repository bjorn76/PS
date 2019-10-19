# Checklist 1 – Validate PC from JM IT 
# Script Edition

cls
write-host -NoNewline -ForegroundColor Cyan "Start of Validate PC from IT: "
Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-output ""

#Write-Host -no User: -no 
write-host -NoNewline -ForegroundColor Cyan "User: "
$env:USERNAME
write-host -NoNewline -ForegroundColor Cyan "Display Lang: "
(Get-WinUserLanguageList)[0].autonym

write-host -NoNewline -ForegroundColor Cyan "Keyboard: "
(Get-WinUserLanguageList)[0].InputMethodTips
(Get-WinUserLanguageList)[1].InputMethodTips

Write-output ""
write-host -NoNewline -ForegroundColor Cyan "Region: "
Get-culture | format-list -Property name

write-host -NoNewline -ForegroundColor Cyan "Dots Expected? - No commas here!"
(Get-culture).NumberFormat  | Format-List -Property NumberDecimalSeparator,CurrencyDecimalSeparator,PercentDecimalSeparator

write-host -NoNewline -ForegroundColor Cyan "Spaces Expected - Neither dots nor commas here!"
(Get-culture).NumberFormat  | Format-List -Property NumberGroupSeparator,CurrencyGroupSeparator,PercentGroupSeparator


write-host -ForegroundColor Cyan "SVN installed?"
$ListOfSW = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object -property DisplayName, Displayversion, installdate
$FoundSW = $ListOfSW -match "TortoiseSVN"
$FoundSW | Format-List
Write-output ""

write-host -ForegroundColor Cyan "SensTool 25 folders - Apps; Docs; FramWork...StopLog - Expected"
Get-ChildItem -directory "C:\SenseTool25" | Select-Object -property Name | Format-Table
write-output ""


$powercfglist = powercfg /list
write-host -ForegroundColor Cyan "Single power?"
write-Output $powercfglist 
write-output ""

write-host -ForegroundColor Cyan "Applied Computer GPO:"
write-output "Getting gpresult (takes a minute)..."
write-output ""
$gpresultComp = gpresult /SCOPE COMPUTER /R
write-output $gpresultComp

write-host -NoNewline -ForegroundColor Cyan "End of Validate PC from IT: "
Get-Date -format "yyyy-MM-dd HH:mm:ss"
