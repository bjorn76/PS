Function Get-F($initialDirectory)
{
  
Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{SelectedPath = 'C:\Temp’}
 
[void]$FolderBrowser.ShowDialog()
$path = $FolderBrowser.SelectedPath



}

# Activate dialog
$file = Get-F
 
#$file = "C:\temp" #fixed path for debug

# https://4sysops.com/archives/measure-object-computing-the-size-of-folders-and-files-in-powershell/
#get-childitem $file | measure -Property Length -sum
#gci $file | measure -Property Length -sum
#gci $file | measure Length -s
#(gci $file | measure Length -s).Sum /1GB

"{0:N2} GB" -f ((gci $file | measure Length -s).Sum /1GB)

