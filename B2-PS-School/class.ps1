cls
class Device {
    [string]$Brand
    [string]$Model
    [string]$VendorSku

    [string]ToString(){
        return ("{0}|{1}|{2}" -f $this.Brand, $this.Model, $this.VendorSku)
    }
}


<#
$dev = [Device]::new()
$dev.Brand = "Microsoft"
$dev
$dev.ToString()
#>

Write-Output "Now B2Date Class"

class B2Time{
[DateTime] hidden $Start
[DateTime] hidden $End


[DateTime]Start2(){
        return ("{0}" -f $this.Start.Date)
        
    }


    [String]StartDate(){
        return ("{0}" -f (get-date $this.Start.Date -Format yyy-MM-dd))
        
    }

[string]ToString(){
        return ("{0} -> {1}" -f $this.Start.Date, $this.End.Date, $this)
        #return ("{0}" -f $this.Start.Date)
    }

[string]ToString2(){
        #return ("{0} -> {1}" -f ($this.Start.Date.Year), $this.End.Date.Year)
        #return ("{0} -> {1}" -f (1111 + 3 ), $this.End.Date.Year)
        #return ("{0} -> {1}" -f ($this.Start.Date.Year.ToString() + "-"+ $this.Start.Date.Month.ToString() ), $this.End.Date.Year)
        return ("{0} -> {1}" -f ((Get-date $this.Start.Date -Format yyyy-MM-dd), (Get-date $this.End.Date -Format yyyy-MM-dd)))
    }

[void] ThisYear(){
      $this.Start = get-date -Month 1 -Day 1 -Hour 0 -Minute 00 -Second 00
      $this.End = get-date -Month 12 -Day 31 # -Hour 23 -Minute 59 -Second 59

    }

[void] LastYear(){
      $this.Start = get-date -Month 1 -Day 1 -Hour 0 -Minute 00 -Second 00
      $this.Start = $this.Start.AddYears(-1)
      $this.End = get-date -Month 12 -Day 31 -Hour 23 -Minute 59 -Second 59
      $this.End = $this.End.AddYears(-1)

    }

    [void] ThisMonth(){
        $today = get-date
        $lastDay = [DateTime]::DaysInMonth($today.Year, $today.Month)

        $firstDate = [DateTime]::new($today.Year, $today.Month, 1)
        $lastDate  = [DateTime]::new($today.Year, $today.Month, $lastDay)

        $this.Start = $firstDate
        $this.End = $lastDate

        #$this.Start = get-date  $today -Day 1 -Hour 0 -Minute 00 -Second 00
        #$this.End = get-date $lastDay  -Hour 0 -Minute 00 -Second 00

    }
        [void] LastMonth(){
        $today = get-date
        $today = $today.AddMonths(-1)
        $lastDay = [DateTime]::DaysInMonth($today.Year, $today.Month)

        $firstDate = [DateTime]::new($today.Year, $today.Month, 1)
        $lastDate  = [DateTime]::new($today.Year, $today.Month, $lastDay)

        $this.Start = $firstDate
        $this.End = $lastDate


    }


}

$mytime = [B2Time]::new()
#$mytime.ThisYear()
#$mytime.LastYear()
#$mytime.ThisMonth()
$mytime.LastMonth()



#$mytime.Start = get-date -Month 1 -Day 1 -Hour 0 -Minute 00 -Second 00
#$mytime.End = get-date -Month 12 -Day 31 -Hour 0 -Minute 00 -Second 00
$md = get-date



$mytime.ToString()
$mytime.ToString2()


