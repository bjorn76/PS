#gpresult /SCOPE COMPUTER /V #Verbose
#gpresult /SCOPE COMPUTER /R
#gpresult /H c:\temp\GPreport.html

# Must be run as admin
write-host -ForegroundColor Cyan "Applied GPO to html report:"
write-output "Getting gpresult (takes a minute)..."
write-output ""

$fileN = ''
$directorypath = Split-Path $MyInvocation.MyCommand.Path
$fileN = $directorypath + '\RSoP_Computer_' + $env:COMPUTERNAME + '.html'
$fileN

$gpresultComp = gpresult /H $fileN /F

#Out-File -FilePath $fileN -InputObject $gpresultComp