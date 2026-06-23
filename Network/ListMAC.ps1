function Invoke-SubnetMacScanner {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateRange(0, 255)]
        [int]$ThirdOctet,

        [Parameter(Mandatory = $true)]
        [ValidateRange(1, 254)]
        [int]$StartIP,

        [Parameter(Mandatory = $true)]
        [ValidateRange(1, 254)]
        [int]$EndIP,

        # New optional parameter for targeted searches
        [Parameter(Mandatory = $false)]
        [string]$SearchMac
    )

    process {
        if ($StartIP -gt $EndIP) {
            Write-Error "Error: Start IP cannot be greater than the End IP."
            return
        }

        # Clean up the search MAC format (remove hyphens, colons, and spaces)
        $CleanSearchMac = $null
        if ($SearchMac) {
            $CleanSearchMac = ($SearchMac -replace '[:-]|\s', '').ToLower()
        }

        $BaseIP = "192.168.$ThirdOctet"
        
        if ($CleanSearchMac) {
            Write-Host "Searching for MAC '$SearchMac' on subnet ${BaseIP}.X..." -ForegroundColor Cyan
        } else {
            Write-Host "Starting full scan on subnet ${BaseIP}.X from .${StartIP} to .${EndIP}..." -ForegroundColor Cyan
        }

        $PingObject = New-Object System.Net.NetworkInformation.Ping
        $Results = [System.Collections.Generic.List[PSCustomObject]]::new()

        foreach ($i in $StartIP..$EndIP) {
            $TargetIP = "$BaseIP.$i"
            $Reply = $PingObject.Send($TargetIP, 50)

            $Neighbor = Get-NetNeighbor -IPAddress $TargetIP -AddressFamily IPv4 -ErrorAction SilentlyContinue | 
                        Where-Object { $_.State -ne 'Unreachable' -and $_.LinkLayerAddress -ne '00-00-00-00-00-00' }

            if ($Neighbor) {
                $FoundMac = $Neighbor.LinkLayerAddress
                $CleanFoundMac = ($FoundMac -replace '[:-]|\s', '').ToLower()

                # If no SearchMac was provided, OR if the current MAC matches the target
                if (-not $CleanSearchMac -or ($CleanFoundMac -eq $CleanSearchMac)) {
                    $Results.Add([PSCustomObject]@{
                        IPAddress  = $TargetIP
                        MACAddress = $FoundMac
                        PingStatus = $Reply.Status
                    })

                    # If we found the specific MAC we wanted, break the loop early to save time
                    if ($CleanSearchMac) {
                        Write-Host "Target device found!" -ForegroundColor Green
                        break
                    }
                }
            }
        }

        # Output formatting
        if ($Results.Count -gt 0) {
            Write-Host "`nScan complete! Results:" -ForegroundColor Green
            $Results | Format-Table -AutoSize
        } else {
            if ($CleanSearchMac) {
                Write-Warning "`nScan complete. The MAC address '$SearchMac' was not found in the range .${StartIP} to .${EndIP}."
            } else {
                Write-Warning "`nScan complete. No active MAC addresses found."
            }
        }
    }
}

# Invoke-SubnetMacScanner -ThirdOctet 0 -StartIP 110 -EndIP 115 -SearchMac  "44-07-0B-35-D8-01";
Invoke-SubnetMacScanner -ThirdOctet 0 -StartIP 90 -EndIP 254 -SearchMac  "C0:74:AD:61:DC:7E";