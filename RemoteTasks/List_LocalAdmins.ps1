<#

https://gallery.technet.microsoft.com/scriptcenter/Get-remote-machine-members-bc5faa57
#>


function get-localadmin {  
param ($strcomputer)  
  
    $admins = Gwmi win32_groupuser –computer $strcomputer   
    $admins = $admins |? {$_.groupcomponent –like '*"Administrators"'}  
  
    $admins |% {  
        $_.partcomponent –match “.+Domain\=(.+)\,Name\=(.+)$” > $nul  
        $matches[1].trim('"') + “\” + $matches[2].trim('"')  
    }
 }     

cls


$ComputerName = 'SEGOD-6ZWR45J' # B2 test PC
#$ComputerName = "SEGOD-GCJ7KQ2" # TC02 - Admin PC
#$ComputerName = 'SEGOD-GDG9KQ2' #TC21 - Admin PC
#$ComputerName = 'SEGOD-GDL8KQ2' #TC01 - Admin PC
#$ComputerName = 'SEGOD-GCJ7KQ2' #TC02 - Admin PC



write-output "List Administrators group on: " 
$ComputerName
get-localadmin ($ComputerName)

<#
#$DomainName = Read-Host "Domain name:"
$DomainName = "johnsonmatthey"

#$ComputerName = Read-Host "Computer name:"
$ComputerName = 

#$UserName = Read-Host "User name:"
$UserName = "johanb01"

$AdminGroup = [ADSI]"WinNT://$ComputerName/Administrators,group"
$User = [ADSI]"WinNT://$DomainName/$UserName,user"
$AdminGroup.add($User.Path)


#>