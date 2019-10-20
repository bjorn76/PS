#https://superuser.com/questions/395818/how-to-change-keyboard-layout-via-command-line-cmd-exe-on-windows-xp-7

CLS

# Set one language
$langlist=New-WinUserLanguageList en-US
#$langlist=new-winuserlanguagelist sv-SE
#$langlist=new-winuserlanguagelist en-GB


# Apply and force to avoid the prompt  message
Set-WinUserLanguageList $langlist -Force

# Show as left
Get-WinUserLanguageList