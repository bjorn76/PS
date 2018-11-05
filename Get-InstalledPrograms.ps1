#https://gallery.technet.microsoft.com/scriptcenter/Listing-all-programs-a4e07c7f
#
# =============================================================================#
#* THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF          *#
#* ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED           *#
#* TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A          *#
#* PARTICULAR PURPOSE.                                                        *#
#* Copyright (C) 1993 - 2017.  Microsoft Corporation.  All rights reserved.   *#
# =============================================================================#

################################################################################
# ==============================================================================================
# NAME: Get-InstalledPrograms.ps1
# 
# AUTHOR:             Liju Varghese, Microsoft
# DATE:               2017-08-29
# Version:            2.2a
# Last working copy:  
# 
# COMMENT:  This script uses information from the following three sources to 
#			create a list of all programs installed on the local machine:
#				Registry: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
#				Registry: HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall
#				WMI:	  Win32_Product class
#			
#			This script requires no parameters. 
#			Output is written to console and exported to the file 
#													InstalledPrograms_<ComputerName>_<Date>.csv
# ==============================================================================================

################################################################################

Clear-Host

$scriptPath       = Split-Path -parent $myInvocation.myCommand.definition
$scriptName       = Split-Path -Leaf   $MyInvocation.MyCommand.Definition
$outputFilename	  = "$scriptPath\" + "InstalledPrograms_" + $env:computername + "_" + $(Get-Date -Format yyyy-MM-dd) + ".csv"

Write-Host "This script queries the local machine for all installed programs" -ForegroundColor Green
Write-Host ""
Start-Sleep 2
$installedApps = @()

Write-Host "     Querying " -ForegroundColor Green -NoNewline
Write-Host "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall " -NoNewline
Write-Host "for program uninstall info" -ForegroundColor Green
Write-Host ""
Start-Sleep 2
$gIPx64 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* `
			| Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation `
				| Sort-Object DisplayName

Write-Host "     Querying " -ForegroundColor Green -NoNewline
Write-Host "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall " -NoNewline
Write-Host "for program uninstall info" -ForegroundColor Green
Write-Host ""
Start-Sleep 2
$gIPx86 = Get-ItemProperty HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* `
			| Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation `
				| Sort-Object DisplayName

Write-Host "     Querying " -ForegroundColor Green -NoNewline
Write-Host "Win32_Product WMI class " -NoNewline
Write-Host "for products installed by Windows Installer" -ForegroundColor Green
Write-Host ""
$gWMIO = Get-WMIObject -Query "SELECT * FROM Win32_Product" `
			| Sort-Object Name,Version,Vendor

Write-Host "Merging information from the 3 sources..." -ForegroundColor Green
Write-Host ""
Start-Sleep 2
foreach ($item in $gIPx64)
	{
	$appProperties = [ordered]@{Source = "Reg_x64Uninstall"
								Name = $item.DisplayName
								Version = $item.DisplayVersion
								Publisher = $item.Publisher
								InstallDate = $item.InstallDate
								InstallLocation = $item.InstallLocation
								}
	$installedApps += New-Object -TypeName PSObject -Property $appProperties
	}

foreach ($item in $gIPx86)
	{
	$appProperties = [ordered]@{Source = "Reg_x86Uninstall"
								Name = $item.DisplayName
								Version = $item.DisplayVersion
								Publisher = $item.Publisher
								InstallDate = $item.InstallDate
								InstallLocation = $item.InstallLocation
								}
	$installedApps += New-Object -TypeName PSObject -Property $appProperties
	}

foreach ($item in $gWMIO)
	{
	$appProperties = [ordered]@{Source = "WMI"
								Name = $item.Name
								Version = $item.version
								Publisher = $item.Vendor
								InstallDate = ""
								InstallLocation = ""
								}
	$installedApps += New-Object -TypeName PSObject -Property $appProperties
	}

Write-Host "Creating a unique list of programs sorted by name:" -ForegroundColor Green
Write-Host ""
Start-Sleep 2
$installedApps | Sort-Object Name -Unique | FT -AutoSize

Write-Host "This list has been exported to " -NoNewline -ForegroundColor Green
Write-Host $outputFilename
Write-Host ""
$installedApps | Sort-Object Name -Unique | Export-Csv -Path $outputFilename -Force -NoTypeInformation
Start-Sleep 2
Write-Host "Script execution complete." -ForegroundColor Green
""
""
""