#Audit script
$auditFile = "audit.txt"
$computername = "." #i.e local machine

"Computer name $computername" > $auditFile 

"Computer details:" >> $auditFile
get-wmiobject Win32_ComputerSystem -computername $computername | 
	select Name, Manufacturer, Model,`
		   NumberOfProcessors, TotalPhysicalMemory, `
		   Domain, CurrentTimeZone, DayLightInEffect |
	Format-List|
	Out-File $auditFile -Append
		   
#os details
"OS details:" >> $auditFile
get-wmiobject Win32_OperatingSystem -computername $computername | 
	select Caption, ServicePackMajorVersion, ServicePackMinorVersion |
	Format-List|
	Out-File $auditFile -Append
				
#CLR versions
".Net details:" >> $auditFile
Get-ChildItem "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP" | Get-ItemProperty|
	Format-List|
	Out-File $auditFile -Append

#powershell version
Add-Content $auditFile "PowerShell version:"
Add-Content $auditFile $Host.Version 


#silverlight version
#$SilverlightVersion = (get-itemproperty  HKLM:\SOFTWARE\Microsoft\Silverlight Version).Version
#Add-Content $auditFile "Silverlight version:"
#Add-Content $auditFile $SilverlightVersion