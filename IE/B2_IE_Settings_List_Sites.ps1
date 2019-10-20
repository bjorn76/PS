
# https://superuser.com/questions/414097/how-to-view-all-ie-trusted-sites-when-security-settings-are-managed
#---------------------------------------------------


$_RegKeyList1 = @()
$_RegKeyList2 = @()
$_RegKeyList3 = @()
$_RegKeyInfo  = @()


#$_RegKeyList1 = $(Get-item 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey' -ErrorAction SilentlyContinue).property  
#$_RegKeyList1 = $(Get-item 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey' -ErrorAction SilentlyContinue).property  | Out-GridView

#$_RegKeyList2 = $(Get-item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey' -ErrorAction SilentlyContinue).property | Out-GridView
$_RegKeyList2 = $(Get-item 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey' -ErrorAction SilentlyContinue).property



#$_RegKeyList3 = $_RegKeyList1 + $_RegKeyList2 
$_RegKeyList3 = $_RegKeyList2 

Foreach($_RegValueName in $_RegKeyList3){

    #$_RegValue = $(Get-ItemProperty -Path 'HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey' -Name $_RegValueName  )
    $_RegValue = $(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMapKey' -Name $_RegValueName  )

    Switch($_RegValue.$_RegValueName){

         0 {$_ZoneType = 'My Computer'}
         1 {$_ZoneType = 'Local Intranet Zone'}
         2 {$_ZoneType = 'Trusted sites Zone'}
         3 {$_ZoneType = 'Internet Zone'}
         4 {$_ZoneType = 'Restricted Sites Zonet'}

    }

    $_RegKeyInfo += "$_RegValueName,$_ZoneType"
    
    

}


#Write-Output  $_RegKeyList3 | Out-GridView


$_RegKeyInfo |  Out-GridView

