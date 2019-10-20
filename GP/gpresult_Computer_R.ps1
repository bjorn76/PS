# Must be run as admin
write-host -ForegroundColor Cyan "Applied Computer GPO:"
write-output "Getting gpresult (takes a minute)..."
write-output ""
$gpresultComp = gpresult /SCOPE COMPUTER /R
$directorypath = Split-Path $MyInvocation.MyCommand.Path
$fileN = $directorypath + '\RSoP_Computer_' + $env:COMPUTERNAME + '.txt'
Out-File -FilePath $fileN -InputObject $gpresultComp
 
