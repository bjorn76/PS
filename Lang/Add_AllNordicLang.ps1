Echo off
cls
#Get-WinUserLanguageList


$langCund_found = $mylang.Count

$mylang=get-winuserlanguagelist
$mylang.add("Sv-SE")
$mylang.add("da")
$mylang.add("fi")
$mylang.add("en-US")
$mylang.add("en-GB")

$langCund_left = $mylang.Count


set-winuserlanguagelist -languagelist $mylang -force

#$langCund_found
Get-WinUserLanguageList
Echo "Number languages: " $langCund_left
