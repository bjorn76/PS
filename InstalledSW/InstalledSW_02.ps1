#Get-ItemProperty "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName,Version, Publisher |format-custom | out-file  C:\temp\instsw_Wow6432Nod.txt
#Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName, DisplayVersion, Publisher,InstallDate |format-custom | out-file  C:\temp\instsw.txt
#Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object -property DisplayName  |format-custom | out-file  C:\temp\instsw.txt

#Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object * |format-custom | out-file  C:\temp\instsw_all.txt

#Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object -property DisplayName | out-file  C:\temp\instsw.txt
$ListOfSW = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object -property DisplayName, Displayversion, installdate
$ListOfSW -match "TortoiseSVN"
