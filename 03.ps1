﻿Remove-Module -Name "B2Functions"
Import-Module -Name "C:\Users\bjorn\Documents\bjorn76\PS\B2Functions.ps1"

Write-Host ""
Write-Host "03 is started"


Get-fileSizeByCreationDate -path "c:\temp" -numberDays 100



Write-Host "03 has ended"