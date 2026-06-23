<#
This is a subnet scnner


2026-06-22


#>


#"C0:74:AD:61:DC:7E"


#Init ARP Cache

90..99 | ForEach-Object {
    #Test-Connection -ComputerName "192.168.29.$_" -Count 1 -Quiet -ErrorAction SilentlyContinue
    Test-Connection -ComputerName "192.168.0.$_" -Count 1
}

100..112 | ForEach-Object {
    #Test-Connection -ComputerName "192.168.29.$_" -Count 1 -Quiet -ErrorAction SilentlyContinue | Out-Null
    Test-Connection -ComputerName "192.168.0.$_" -Count 1
}

152..152 | ForEach-Object {
    #Test-Connection -ComputerName "192.168.29.$_" -Count 1 -Quiet -ErrorAction SilentlyContinue | Out-Null
    Test-Connection -ComputerName "192.168.0.$_" -Count 1
}


Get-NetNeighbor | Where-Object {
    $_.LinkLayerAddress -replace '-' , ':' -ieq "C0:74:AD:61:DC:7E"
}

#test-connection -ComputerName "192.168.29.149" -TcpPort 80


