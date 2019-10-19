# https://gallery.technet.microsoft.com/scriptcenter/How-to-change-the-System-82479048
# help IT admins to batch change the Regional Settings in Windows. 

$sCountry = (Get-ItemProperty -Path $RegKeyPath -Name sCountry).sCountry 
$sShortDate = (Get-ItemProperty -Path $RegKeyPath -Name sShortDate).sShortDate 
$sLongDate = (Get-ItemProperty -Path $RegKeyPath -Name sLongDate).sLongDate 
$sShortTime = (Get-ItemProperty -Path $RegKeyPath -Name sShortTime).sShortTime 
$sTimeFormat = (Get-ItemProperty -Path $RegKeyPath -Name sTimeFormat).sTimeFormat 
$iFirstDayOfWeek = (Get-ItemProperty -Path $RegKeyPath -Name iFirstDayOfWeek).iFirstDayOfWeek 
 
$Obj = New-Object -TypeName PSObject -Property @{ 
"Country" = $sCountry 
"Short date" = $sShortDate 
"Long date" = $sLongDate 
"Short time" = $sShortTime 
"Long time" = $sTimeFormat 
"First day of week" = $iFirstDayOfWeek 
} 
 
Write-Host "The current date and time formats:" 
$Obj 