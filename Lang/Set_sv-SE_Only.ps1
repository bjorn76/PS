
CLS

# Set one language
$mylang=new-winuserlanguagelist sv-SE
#$mylang=new-winuserlanguagelist en-GB
#$mylang=new-winuserlanguagelist en-US

# Apply and force to avoid the prompt  message
set-winuserlanguagelist -languagelist $mylang -Force

# Show as left
Get-WinUserLanguageList
