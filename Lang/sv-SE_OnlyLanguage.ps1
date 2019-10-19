
CLS

$mylang=new-winuserlanguagelist sv-SE
#$mylang=new-winuserlanguagelist en-GB
#$mylang=new-winuserlanguagelist en-US
set-winuserlanguagelist -languagelist $mylang -Force
Get-WinUserLanguageList
