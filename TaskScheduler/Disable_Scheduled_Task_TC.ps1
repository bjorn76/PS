# Disable_Scheduled_Task_TC.ps1
# History:
# 2019-01-24 Frist version. WinSAT and Defender AV scan. /BNJ
#  




$AsFounds = 0..1
$AsLefts = 0..1

cls


Write-Host -nonewline -foregroundcolor cyan "As found: "

$AsFounds[0] =  Get-ScheduledTask -TaskPath "\Microsoft\Windows\Maintenance\" -TaskName "WinSAT"
$AsFounds[1] = Get-ScheduledTask -TaskPath "\Microsoft\Windows\Windows Defender\" -TaskName "Windows Defender Scheduled Scan" 


$AsFounds | Format-Table

$i = 0
foreach ($AsFound in $AsFounds) {

$AsLefts[$i] = Disable-ScheduledTask -InputObject $AsFound 
# $AsLefts[$i] = Enable-ScheduledTask -InputObject $AsFound      # Used when tested

$i +=1
}



Write-Host -nonewline -foregroundcolor cyan "As left: "
$AsLefts | Format-Table


