

$thisyear = get-date -Format yyyy

$lastyear = $thisyear-1

$lastyear # this is a int

#get-date | gm

#get-date -Format yyyy

$NextYear = (get-date).AddYears(1)

$NextYear # This a a date

$NextYear.Year


$adate = get-date -Year 2018 -Month 1 -Day 1

get-date $adate -format yyyy

#$adate |gm

        $today = get-date
        $lastDay = [DateTime]::DaysInMonth($today.Year, $today.Month)
        $lastDay
    $today.AddMonths(-1)

