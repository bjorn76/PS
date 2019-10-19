Echo off
cls
#Get-WinUserLanguageList
Echo "Number languages: " $mylang.Count

$mylang=get-winuserlanguagelist
$mylang.add("Sv-SE")
$mylang.Count
#$mylang.add("en-US")
#$mylang.add("en-GB")


set-winuserlanguagelist -languagelist $mylang -force


Get-WinUserLanguageList
