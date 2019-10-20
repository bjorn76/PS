CLS

Echo "Start of 'B2_Verify_Win10_Settings' report"
Echo "*********************************************"

Echo "Computer name:"
$computername = "." # is local machine
get-wmiobject Win32_ComputerSystem -computername $computername | 
	select Name, Manufacturer, Model, Domain | Format-List | Out-Host


#------------------------------------------------------
Echo ""
Echo "Logged on user:"
$B2_USERNAME = Get-WMIObject -class Win32_ComputerSystem | 
   select username  |Format-List| Out-String 
$B2_USERNAME
#0r
#$env:USERNAME


Echo ""
Echo "List of Local Admins"
Get-LocalGroupMember -Group "Administrators"



#------------------------------------------------------
Echo ""
Echo "Keybord Settings:"

$KeybArr = @() #Emty string array

$langList = Get-WinUserLanguageList
foreach ($La in $langList)
   {
   
       foreach ($imt in $La.InputMethodTips)
       {
    
        $KeybArr += $imt

        }
   }
   
   $KeybArr += "Count of Keyboard codes above is: " +  $KeybArr.Count
   $KeybArr += "(code '041D:0000041D' is Swedish)"
   $KeybArr

#------------------------------------------------------
#Next


#------------------------------------------------------
   Echo ""
   Echo "*********************************************"
   Echo "End. (of 'B2_Verify_Win10_Settings' report)"