# Shows a folder selecti dialog
Function Get-F($initialDirectory)
{
  
Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{SelectedPath = $initialDirectory }
 
[void]$FolderBrowser.ShowDialog()

$FolderBrowser.SelectedPath

}

# Calculated the sum of files witin a date range
Function Get-fileSizeByCreation
{
  Param([string[]]$path, [DateTime] $Start, [DateTime] $End)

  $datestring = (get-date $Start -format yyyy-MM-dd) + (" -> ") + (get-date $End -format yyyy-MM-dd) + " in folder $path :" 
  
  write-host -ForegroundColor Cyan  $datestring
  
  $fo = Get-ChildItem -Recurse -Path $path |  Where-Object {($_.CreationTime -le $End) -and ($_.CreationTime -gt $Start) }
  "{0:N2} GB" -f (($fo | measure Length -s).Sum /1GB)
}




#===================================================================================

Write-Host ""
Write-Host -ForegroundColor Cyan "Calc file size of a date range has started"

# Activate dialog
$file = Get-F 'c:\users\bjorn'
 #$file = 'c:\users\bjorn' # Skip dialog when debugging


#Date will be set by class later
$st = New-Object DateTime (2019,10,1)
$en = New-Object DateTime (2019,10,20)


Get-fileSizeByCreation -path $file -Start $st -End $en


Write-Host -ForegroundColor Cyan "end."