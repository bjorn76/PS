# List_Scheduled_Task.ps1
# Must run as administrator
# History:
# 1) List all scheudled task
# 2) Lis info on first and 2nd objects
# 3) List info on all objects
# 5) Join TaskNames





cls

$Found
$aSchTask
$FoundInfo
$FoundInfo1
$FoundInfo2

#cls



# 1) Start of 1

Write-Host -nonewline -foregroundcolor cyan "Get all Tasks Scheduled: "
$Found =  Get-ScheduledTask -TaskPath "*"
$Found | Format-Table



# 2)     Start of 2
Write-Host -nonewline -foregroundcolor cyan "More info on the first 2 Tasks Scheduled: "

$FoundInfo1 = Get-ScheduledTaskInfo -InputObject $Found[1]
$FoundInfo2 = Get-ScheduledTaskInfo -InputObject $Found[2]


$FoundInfo1 | format-List
$FoundInfo2 | format-List

# 3)     Start of 3
Write-Host -nonewline -foregroundcolor cyan "More info on ALL Tasks Scheduled: "

$i = 0

foreach ($aSchTask in $Found) {
  Get-ScheduledTaskInfo -InputObject $aSchTask      
      

  $i +=1

}

$FoundInfo =  Get-ScheduledTaskInfo -InputObject  $Found[2]
$FoundInfo | Format-Table


$FoundInfo = $FoundInfo1, $FoundInfo2





# Start of slask lines


#@FoundInfo += Get-ScheduledTaskInfo -InputObject $aSchTask  | Select-Object LastRunTime, TaskName, NextRunTime
#$Found | Sort-Object Taskname | Export-Csv -Path c:\temp\ScheduledTask.csv
