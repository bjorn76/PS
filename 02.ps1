Remove-Module -Name "B2Functions"
Import-Module -Name "C:\Users\bjorn\Documents\bjorn76\PS\B2Functions.ps1"

Write-Host ""
Write-Host "02 is started"

Get-NeglectedFiles -path "c:\temp" -numberDays 30
Get-NeglectedFiles -path "c:\temp" -numberDays 30 | measure -sum length | % {$_.sum / 1gb}

Write-Host "02 has ended"
