# List_Scheduled_Task.ps1
# Must run as administrator
# History:
# 
#  




$Found
$aSchTask
$FoundInfo
$FoundInfo1
$FoundInfo2

#cls


Write-Host -nonewline -foregroundcolor cyan "Found: "

$Found =  Get-ScheduledTask -TaskPath "*"

#$Found =  Get-ScheduledTaskInfo -Taskname "Schedule Scan"


# $Found | Format-Table | Export-Csv -Path c:\temp\ScheduledTask.csv

# $Found | Format-List
# $Found | Format-Table -AutoSize

#$Found | Select-Object Taskname, Status |  Export-Csv -Path c:\temp\ScheduledTask.csv
#$Found | Select-Object Taskname, Status  | Format-Table #| Out-File c:\temp\ScheduledTask.csv
#$Found | Select-Object *  | Format-Table
#$Found | Format-Table

$FoundInfo1 = Get-ScheduledTaskInfo -InputObject $Found[1]
$FoundInfo2 = Get-ScheduledTaskInfo -InputObject $Found[2]

$i = 0

#$Found.Count




foreach ($aSchTask in $Found) {


#$FoundInfo[$i] = Get-ScheduledTaskInfo -InputObject $aSchTask      
#@FoundInfo += Get-ScheduledTaskInfo -InputObject $aSchTask  | Select-Object LastRunTime, TaskName, NextRunTime      

$i +=1

}



$FoundInfo1 |format-table
$FoundInfo2 |format-List

$FoundInfo = $FoundInfo1 AND $FoundInfo2


#$Found | Sort-Object Taskname | Export-Csv -Path c:\temp\ScheduledTask.csv



