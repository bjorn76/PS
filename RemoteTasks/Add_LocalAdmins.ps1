<#

https://4sysops.com/archives/add-a-user-to-the-local-administrators-group-on-a-remote-computer/
#>

cls
#$DomainName = Read-Host "Domain name:"
$DomainName = "johnsonmatthey"

#$ComputerName = Read-Host "Computer name:"
$ComputerName = "SEGOD-6ZWR45J" # B2 test PC
#$ComputerName = "SEGOD-GCJ7KQ2" # TC02 - Admin PC
#$ComputerName = "SEGOD-GDG9KQ2" # TC21 - Admin PC
#ComputerName = "SEGOD-GDL8KQ2" # TC01 - Admin PC


#$UserName = Read-Host "User name:"
$UserName = "AkessJ01"

# for each 

$AdminGroup = [ADSI]"WinNT://$ComputerName/Administrators,group"
$User = [ADSI]"WinNT://$DomainName/$UserName,user"
$AdminGroup.add($User.Path)
Write-host -nonewline $UserName " added to Administrators in PC " $ComputerName




<#
HDD test
JOHNSONMATTHEY\KaralA01
JOHNSONMATTHEY\WeibuF01
JOHNSONMATTHEY\LauriA01
JOHNSONMATTHEY\AnderE01
JOHNSONMATTHEY\SaawA01
JOHNSONMATTHEY\AkessJ01
JOHNSONMATTHEY\RisbeR01

#>
