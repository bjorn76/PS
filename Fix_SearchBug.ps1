<#
     BNJ 2018-11-07
**************************************************************************
1.	Log out the effected user
2.	Log on as with a local admin accoung
3.	Start up both powershell(Admin) and Task Manager.
4.	In Task manager, end "explorer.exe
5.	Rename a folder - In Powershell(Admin), use this line:
Rename-Item -path 'C:\Users\(AffectedUsername)\AppData\Local\Packages\
Microsoft.Windows.Cortana_cw5n1h2txyewy' -newName 'Cortana_backup'
6.	Win+r > type in "explorer.exe". Ui should be back again.
7.	Restart computer and done.
**************************************************************************



#>
cls
$AffectedUsername = 'SRV_ENTC13'
cd c:\users\$AffectedUsername
#cd c:\users\$env:USERNAME

Write-Host "Affected user folders exist (if no error is shown)"
pause

Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoRestartShell -Value 0
Stop-Process -ProcessName explorer -Force
Write-Host "Explorer stopped"
pause


rename-Item -path "C:\Users\$AffectedUsername\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy" -newName "Cortana_backup"


start-Process explorer
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoRestartShell -Value 1
