#https://superuser.com/questions/395818/how-to-change-keyboard-layout-via-command-line-cmd-exe-on-windows-xp-7

#{0409:00000409}


#$langlist=new-winuserlanguagelist sv-SE
#$langlist=new-winuserlanguagelist en-GB
CLS

$langlist=new-WinUserLanguageList en-US


#Clears the other input methods from the displayed language
$langlist[0].InputMethodTips.Clear()

#Sets and adds the Swedish keyboard
#$langlist[0].InputMethodTips.Add('041D:0000041D')
#$langlist[0].InputMethodTips.Add 041D:0000041D

$langlist[0].InputMethodTips.Insert [041D:0000041D]
#$langlist.InputMethodTips.co


#Apply the changes made on the system (and force to avoid the prompt  message)
Set-WinUserLanguageList $langlist -Force
Get-WinUserLanguageList