# Set_DotAsDeciSep.ps1
# BNJ: Created 2018-11-06

write-host "As found: "
write-host -NoNewline -ForegroundColor Cyan "Dots Expected? - No commas here!"
(Get-culture).NumberFormat  | Format-List -Property NumberDecimalSeparator,CurrencyDecimalSeparator,PercentDecimalSeparator

write-host -NoNewline -ForegroundColor Cyan "Spaces Expected - Neither dots nor commas here!"
(Get-culture).NumberFormat  | Format-List -Property NumberGroupSeparator,CurrencyGroupSeparator,PercentGroupSeparator




$myCinfo = Get-Culture
$myCinfo.numberformat.NumberDecimalSeparator = '.'
$myCinfo.numberformat.CurrencyDecimalSeparator = '.'
$myCinfo.numberformat.PercentDecimalSeparator = '.'

$myCinfo.numberformat.NumberGroupSeparator = ' '
$myCinfo.numberformat.CurrencyGroupSeparator = ' '
$myCinfo.numberformat.PercentGroupSeparator = ' '
 
Set-Culture $myCinfo



write-host " "
write-host " "
write-host "As left: "
write-host -NoNewline -ForegroundColor Cyan "Dots Expected? - No commas here!"
(Get-culture).NumberFormat  | Format-List -Property NumberDecimalSeparator,CurrencyDecimalSeparator,PercentDecimalSeparator

write-host -NoNewline -ForegroundColor Cyan "Spaces Expected - Neither dots nor commas here!"
(Get-culture).NumberFormat  | Format-List -Property NumberGroupSeparator,CurrencyGroupSeparator,PercentGroupSeparator
Write-Host "Press any key to Exit..."
Read-Host



