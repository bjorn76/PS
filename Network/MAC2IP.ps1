<#


#>


#"C0:74:AD:61:DC:7E"


#Init ARP Cache
100..150 | ForEach-Object {
    #Test-Connection -ComputerName "192.168.29.$_" -Count 1 -Quiet -ErrorAction SilentlyContinue | Out-Null
    Test-Connection -ComputerName "192.168.29.$_" -Count 1
}

152..254 | ForEach-Object {
    #Test-Connection -ComputerName "192.168.29.$_" -Count 1 -Quiet -ErrorAction SilentlyContinue | Out-Null
    Test-Connection -ComputerName "192.168.29.$_" -Count 1
}


Get-NetNeighbor | Where-Object {
    $_.LinkLayerAddress -replace '-' , ':' -ieq "C0:74:AD:61:DC:7E"
}

test-connection -ComputerName "192.168.29.149" -TcpPort 80


