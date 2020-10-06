# List_Scheduled_Task.ps1
# Must run as administrator
# History:
# 1) List all scheudled task
# 2) Lis info on first and 2nd objects
# 3) List info on all objects
# 5) Join TaskNames






$Found
$aSchTask
$FoundInfo
$FoundInfo1
$FoundInfo2

#cls


Write-Host -nonewline -foregroundcolor cyan "Found: "



# 1) Start of 1
$Found =  Get-ScheduledTask -TaskPath "*"




#$Found | Format-Table



# 2)     Start of 2


$FoundInfo1 = Get-ScheduledTaskInfo -InputObject $Found[1]
$FoundInfo2 = Get-ScheduledTaskInfo -InputObject $Found[2]


$FoundInfo3= $FoundInfo1 #+ $FoundInfo2


$i = 0

#$Found.Count




foreach ($aSchTask in $Found) {


#$FoundInfo[$i] = Get-ScheduledTaskInfo -InputObject $aSchTask      
#@FoundInfo += Get-ScheduledTaskInfo -InputObject $aSchTask  | Select-Object LastRunTime, TaskName, NextRunTime      

$i +=1

}



$FoundInfo1 |format-table
$FoundInfo2 |format-List




#$Found | Sort-Object Taskname | Export-Csv -Path c:\temp\ScheduledTask.csv



# Start of slask lines