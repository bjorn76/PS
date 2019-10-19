Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{SelectedPath = 'C:\Temp’}
 
[void]$FolderBrowser.ShowDialog()
$path = $FolderBrowser.SelectedPath

write-host $path