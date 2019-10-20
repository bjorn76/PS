
cls
Write-Output "The basic:" -
# Creaates a date object with current date and time
$today = get-date
Write-Output "$today"


Write-Output "Fixed dates:"

#Creates a fixed date time
$adate = get-date -Year 2018 -Month 1 -Day 1 -hour 0 -Minute 0 -Second 0

#Creates a fixed date time
$lastDay_int = [DateTime]::DaysInMonth($today.Year, $today.Month)  # DaysInMonth is a static member
$LastDayThisMonth = [DateTime]::new(2018,1,1)
$LastDayThisMonth


# -Format outputs other data types
$thisyear = get-date -Format yyyy #thisyear is an integer
$lastyear = $thisyear-1
$lastyear # this is a integer


#get-date | gm # gm is alias for Get-Member


$NextYear = (get-date).AddYears(1)

$NextYear # This a a datetime

$NextYear.Year #this outputs an integer

#get-date kan have a variable as parameter. 
#get-date $adate -format yyyy





