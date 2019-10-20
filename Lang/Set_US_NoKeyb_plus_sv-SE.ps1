$languageList = New-WinUserLanguageList en-US
$languageList[0].InputMethodTips.Clear()
$languageList[0].InputMethodTips.Add('041D:0000041D')
Set-WinUserLanguageList $languageList -Force

# Show as left
Get-WinUserLanguageList