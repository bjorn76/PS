

Remove-Module -Name "B2Functions"
Import-Module -Name "C:\Users\bjorn\Documents\bjorn76\PS\B2Functions.ps1"
#get-module -ListAvailable
Write-Host "01 is started"

B2ListFolder3 -path "c:\temp"
B2ListFolder3 -path "c:\temp" | Export-Csv -path "c:\temp\fdata.csv"

Write-Host "01 has ended"




