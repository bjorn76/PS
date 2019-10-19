#The sample scripts are not supported under any Microsoft standard support 
#program or service. The sample scripts are provided AS IS without warranty  
#of any kind. Microsoft further disclaims all implied warranties including,  
#without limitation, any implied warranties of merchantability or of fitness for 
#a particular purpose. The entire risk arising out of the use or performance of  
#the sample scripts and documentation remains with you. In no event shall 
#Microsoft, its authors, or anyone else involved in the creation, production, or 
#delivery of the scripts be liable for any damages whatsoever (including, 
#without limitation, damages for loss of business profits, business interruption, 
#loss of business information, or other pecuniary loss) arising out of the use 
#of or inability to use the sample scripts or documentation, even if Microsoft 
#has been advised of the possibility of such damages 
#--------------------------------------------------------------------------------- 

#requires -version 2.0

Function Set-RegionSettings
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)]
        [String]$Country,
        [Parameter(Mandatory=$true)]
        [String]$ShortDate,
        [Parameter(Mandatory=$true)]
        [String]$LongDate,
        [Parameter(Mandatory=$true)]
        [String]$ShortTime,
        [Parameter(Mandatory=$true)]
        [String]$TimeFormat,
        [Parameter(Mandatory=$true)]
        [String]$FirstDayOfWeek
    )

    $RegKeyPath = "HKCU:\Control Panel\International"
    If ($Country)
    {
        Set-ItemProperty -Path $RegKeyPath -Name sCountry -Value "$Country"
        Write-Verbose "Successfully changed value of country."
    }

    If ($ShortDate)
    {
        Set-ItemProperty -Path $RegKeyPath -Name sShortDate -Value "$ShortDate"
        Write-Verbose "Successfully changed value of short date."
    }
    
    If($LongDate)
    {
        Set-ItemProperty -Path $RegKeyPath -Name sLongDate -Value "$LongDate"
        Write-Verbose "Successfully changed value of long date."
    }

    If($ShortTime)
    {
        Set-ItemProperty -Path $RegKeyPath -Name sShortTime -Value "$ShortTime"
        Write-Verbose "Successfully changed value of short time."
    }

    If($TimeFormat)
    {
        Set-ItemProperty -Path $RegKeyPath -Name sTimeFormat -Value "$TimeFormat"
        Write-Verbose "Successfully changed value of time format."
    }

    If($FirstDayOfWeek)
    {
        Set-ItemProperty -Path $RegKeyPath -Name iFirstDayOfWeek -Value "$FirstDayOfWeek"
        Write-Verbose "Successfully changed value of first day of week."
    }

    $sCountry = (Get-ItemProperty -Path $RegKeyPath -Name sCountry).sCountry
    $sShortDate = (Get-ItemProperty -Path $RegKeyPath -Name sShortDate).sShortDate
    $sLongDate = (Get-ItemProperty -Path $RegKeyPath -Name sLongDate).sLongDate
    $sShortTime = (Get-ItemProperty -Path $RegKeyPath -Name sShortTime).sShortTime
    $sTimeFormat = (Get-ItemProperty -Path $RegKeyPath -Name sTimeFormat).sTimeFormat
    $iFirstDayOfWeek = (Get-ItemProperty -Path $RegKeyPath -Name iFirstDayOfWeek).iFirstDayOfWeek

    $Obj = New-Object -TypeName PSObject -Property @{
    "Country" = $sCountry
    "Short date" = $sShortDate
    "Long date" = $sLongDate
    "Short time" = $sShortTime
    "Long time" = $sTimeFormat
    "First day of week" = $iFirstDayOfWeek
    }

    Write-Host "The current date and time formats:"
    $Obj
}


Set-RegionSettings -ShortDate "M/d/yyyy" -LongDate "dddd,MMMM d,yyyy" -ShortTime "h:mm tt" -TimeFormat "h:mm:ss tt" -FirstDayOfWeek "Sunday" -Country "United States"