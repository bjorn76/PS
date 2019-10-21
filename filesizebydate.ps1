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


  Write-Host -ForegroundColor Cyan "Fetch all files in $path"
  $AllFiles = (Get-ChildItem -Recurse -Path $path)

  $TotSize = "{0:N2} GB" -f (($AllFiles | measure Length -s).Sum /1GB)

  Write-host -ForegroundColor Cyan "Total size is: $TotSize "
  
  #Print out oldest
  $Item = $AllFiles | Sort CreationTime | select -First 1            
  Write-Host -NoNewline -ForegroundColor Cyan "Oldest file/folder is: $($Item.FullName)"
  $oldestdate = get-date $($item.creationtime) -Format yyyy-MM-dd
  Write-host -ForegroundColor Cyan " ( $oldestdate )"

  $datestring = "...files from " + (get-date $Start -format yyyy-MM-dd) + (" to ") + (get-date $End -format yyyy-MM-dd) + " is: " 
  write-host -NoNewline -ForegroundColor white  $datestring



  
  $filesInDateRange = $AllFiles |  Where-Object {($_.CreationTime -le $End) -and ($_.CreationTime -gt $Start) }
  "{0:N2} GB" -f (($filesInDateRange | measure Length -s).Sum /1GB)





}



Function Get-fileSizeByCreationYear
{
  #Param([string[]]$path, [DateTime] $Start, [DateTime] $End)
  Param([string[]]$path)

  #[DateTime] $Start
  #[DateTime] $End


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
  $End = $Start.AddYears(1)


  $iStart = $Start.Year
  $iEnd = $End.Year



  	
 # for ($i=$iStart; $i -lt $iEnd; $i++)
  for ($i=1; $i -lt 5; $i++)

  {
    $datestring = "...files from " + (get-date $Start -format yyyy-MM-dd) + (" to ") + (get-date $End -format yyyy-MM-dd) + " is: " 
    write-host -NoNewline -ForegroundColor white  $datestring
  
   $filesInDateRange = $AllFiles |  Where-Object {($_.CreationTime -le $End) -and ($_.CreationTime -gt $Start)}
   $size = "{0:N2} GB" -f (($filesInDateRange | measure Length -s).Sum /1GB)
   Write-Host  $size

  

   write-host $size

   $Start=$Start.AddYears(1)
   $End = $End.AddYears(1)





  }







}



#===================================================================================

Write-Host ""
Write-Host -ForegroundColor Cyan "Start"
Write-Host -ForegroundColor White "Size of..."

# Activate dialog
#$file = Get-F 'c:\users\bjorn'
$file = 'c:\users\bjorn' # Skip dialog when debugging
#$file = '\\DS415\Media2' # Skip dialog when debugging

#Date will be set by class later
$st = New-Object DateTime (2019,9,1)
$en = New-Object DateTime (2019,10,20)


Get-fileSizeByCreationYear -path $file


Write-Host -ForegroundColor Cyan "end."