# Shows a folder selecti dialog
Function Get-F($initialDirectory)
{
  
Add-Type -AssemblyName System.Windows.Forms
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{SelectedPath = $initialDirectory }
 
[void]$FolderBrowser.ShowDialog()

$FolderBrowser.SelectedPath

}



Function Get-fileSizeByCreationYear
{

  Param([string[]]$path)

  Write-Host -ForegroundColor Cyan "Fetch all files in $path"
  $AllFiles = (Get-ChildItem -Recurse -Path $path)

  $TotSize = "{0:N2} GB" -f (($AllFiles | measure Length -s).Sum /1GB)

  Write-host -ForegroundColor Cyan "Total size is: $TotSize "
  
  #Get the oldest

  $Item = $AllFiles | Sort CreationTime | select -First 1            
  Write-Host -NoNewline -ForegroundColor Cyan "Oldest file/folder is: $($Item.FullName)"
  $oldestdate = get-date $($item.creationtime) -Format yyyy-MM-dd
  Write-host -ForegroundColor Cyan " ( $oldestdate )"

  
  $Start =Get-date $oldestdate -Month 1 -Day 1
  $Period = $Start.AddYears(1)
  $Period = $Start.AddDays(-1)
  $End = [System.DateTime]::Today


  $iStart = $Start.Year
  $iEnd = $End.Year

  
  Write-Host "Start: $iStart End: $iEnd #Debug

  	
 
  #for ($i=$j; $i -lt $iEnd; $i++)

  for ($i=$iStart; $i -lt $iEnd ; $i++)

  {
    $datestring = "...files from " + (get-date $Start -format yyyy-MM-dd) + (" to ") + (get-date $Period -format yyyy-MM-dd) + " is: " 
    write-host -NoNewline -ForegroundColor white  $datestring
  
   $filesInDateRange = $AllFiles |  Where-Object {($_.CreationTime -le $Period) -and ($_.CreationTime -gt $Start)}
   $size = "{0:N2} GB" -f (($filesInDateRange | measure Length -s).Sum /1GB)
   Write-Host  $size

   write-host $size

   $Start=$Start.AddYears(1)
   $Period = $Period.AddYears(1)

  }







}



#===================================================================================

Write-Host ""
Write-Host -ForegroundColor Cyan "Start"
Write-Host -ForegroundColor White "Size of..."

# Activate dialog
#$file = Get-F 'c:\users\bjorn'
#$file = 'c:\users\bjorn' # Skip dialog when debugging
$file = 'X:\BjornJ' # Skip dialog when debugging
#$file = '\\DS415\Media2' # Skip dialog when debugging


Get-fileSizeByCreationYear -path $file


Write-Host -ForegroundColor Cyan "end."