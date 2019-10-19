# Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*s*" | Select-Object DisplayName |format-table
#Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*S*" | Select-Object Publisher |format-table

# The 64-bit program view
Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*TortoiseSVN*" | Select-Object DisplayName |format-custom
#32 bit program view
# Get-ItemProperty "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*Tort*" | Select-Object DisplayName |format-custom
