# Must be run as admin
write-host -ForegroundColor Cyan "Report (RsOP) applied Computer Group Policies:"
write-output "Getting gpresult (takes a minute)..."
write-output ""

$directorypath = Split-Path $MyInvocation.MyCommand.Path
$fileN = $directorypath + '\RSoP_Computer_H_' + $env:COMPUTERNAME + '.htm'

gpresult /H $fileN /F
write-host -ForegroundColor Cyan "Html report is created and saved as " $fileN

$gpresultComp
 
