#CLS

$KeybArr = @() #Emty string array




$langList = Get-WinUserLanguageList
foreach ($La in $langList)
   {
   
       foreach ($imt in $La.InputMethodTips)
       {
    
        $KeybArr += $imt

        }
   }
   $KeybArr
   Echo "Count of Keyb: " $KeybArr.Count