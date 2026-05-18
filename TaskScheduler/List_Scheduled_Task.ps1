# List_Scheduled_Task.ps1
# Must run as administrator
# History:
# 1) List all scheudled task
# 2) Lis info on first and 2nd objects
# 3) List info on all objects
# 5) Join TaskNames



cls
Clear-Variable Info0, Info1, Info2, Info3, Info4
Clear-Variable TaskInfo, TaskInfo_ 

# 1) Start of 

Write-Host -nonewline -foregroundcolor cyan "Get all Tasks Scheduled: "
$AllScheduledTasks =  Get-ScheduledTask -TaskPath "\Microsoft*"
#$AllScheduledTasks | Format-Table



# 2)     Start of 2
#Write-Host -nonewline -foregroundcolor cyan "More info on the first 2 Tasks Scheduled: "

$Info0 = Get-ScheduledTaskInfo -InputObject $AllScheduledTasks[0]
$Info1 = Get-ScheduledTaskInfo -InputObject $AllScheduledTasks[1]
$Info2 = Get-ScheduledTaskInfo -InputObject $AllScheduledTasks[2]
#$Info3 = Get-ScheduledTaskInfo -InputObject $AllScheduledTasks[3]
#$Info4 = Get-ScheduledTaskInfo -InputObject $AllScheduledTasks[4]



$Info12 = $Info0, $Info1, $Info2, $Info3, $Info4
$Info12 | Format-List


#$Info122 = $Info12 , $Info2
#$Info122 | Format-Table


# 3)     Start of 3
Write-Host -nonewline -foregroundcolor cyan "More info on ALL Tasks Scheduled: "




#foreach ($Task in $AllScheduledTasks) {
#For($i=0; $i -le $AllScheduledTasks.count ; $i++) {

For($i=0; $i -le 2 ; $i++) {
 
  $TaskInfo_ = Get-ScheduledTaskInfo -InputObject $AllScheduledTasks[$i] 
  $TaskInfo =   $TaskInfo, $TaskInfo_     


}


$TaskInfo | Format-list
$i




# Start of slask lines


#@FoundInfo += Get-ScheduledTaskInfo -InputObject $aSchTask  | Select-Object LastRunTime, TaskName, NextRunTime
#$Found | Sort-Object Taskname | Export-Csv -Path c:\temp\ScheduledTask.csv
