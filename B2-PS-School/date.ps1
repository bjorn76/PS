
cls
# Creaates a date object with current date and time
write-host -ForegroundColor Cyan "DateTime in Power Shell"
write-host -ForegroundColor Cyan "========================"
$today = get-date # is like now
$today2 = [System.DateTime]::Now
$today3 = [System.DateTime]::Today
write-host -ForegroundColor Cyan "Now and Today in default format: "

write-host "$today"
write-host "$today2"
write-host "$today3"

write-host ""


#Creates a fixed date time
write-host -ForegroundColor Cyan "Fixed dates:"
$adate = get-date -Year 2001 -Month 1 -Day 1 -hour 0 -Minute 0 -Second 0
$adate2 = New-Object DateTime (2002,2,2)
$adate3 = [DateTime]::new(2003,3,3)

get-date $adate -Format yyyy-MM-dd
write-host "$adate2"
write-host $adate3
$adate3

write-host ""


#Static members
write-host -ForegroundColor Cyan "Static members:"
$nbrofdays = [DateTime]::DaysInMonth($today.Year, $today.Month)  # DaysInMonth is a static member
$LastDateThisMonth = New-Object Datetime($today.Year, $today.Month,$nbrofdays)

$LastDateThisMonth
write-host $LastDateThisMonth
write-host "$LastDateThisMonth"
write-host ""






# -Format outputs other data types

write-host -ForegroundColor Cyan "Format returns other data types:"
$thisyear = get-date -Format yyyy #thisyear is an integer
$lastyear = $thisyear-1
$lastyear # this is a integer
write-host ""




# Offset methods

write-host -ForegroundColor Cyan "Offset methods like AddYears(-1) is useful:"

$NextYear = (get-date).AddYears(1)
$NextYear # This a a datetime
$NextYear.Year #this outputs an integer
write-host ""



# Misc
# ======
# get-date | gm # gm is alias for Get-Member
# Get-Date | gm -static  # -static is only listing static members



