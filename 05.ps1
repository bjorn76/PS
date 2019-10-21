Remove-Module -Name "B2Functions"
Import-Module -Name "C:\Users\bjorn\Documents\bjorn76\PS\B2Functions.ps1"

Function Get-fileSizeByCreation

{

 Param([string[]]$path, [DateTime] $Start, [DateTime] $End)

 write-host -ForegroundColor Cyan "$Start -> $End"



 $fo = Get-ChildItem -Recurse -Path $path |  Where-Object {($_.CreationTime -le $End) -and ($_.CreationTime -gt $Start) }
 "{0:N2} GB" -f (($fo | measure Length -s).Sum /1GB)

 
}






Write-Host ""
Write-Host -ForegroundColor Cyan "05 is started"

$st = New-Object DateTime (2019,9,1)
$en = New-Object DateTime (2019,10,20)


Get-fileSizeByCreation -path "C:\Users\bjorn" -Start $st -End $en


Write-Host -ForegroundColor Cyan "05 has ended"