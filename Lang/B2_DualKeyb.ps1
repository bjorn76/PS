#https://github.com/fdcastel/setup/blob/master/Setup-DualKeyboardLayout.ps1

# Set two Keyboard Layouts: pt-BR/ABNT2, en-US/International

# Determine Windows version
$WindowsVersion = [System.Environment]::OSVersion.Version.Major * 10 + [System.Environment]::OSVersion.Version.Minor

if ($WindowsVersion -ge 62)
{
    # Windows 8 or higher
    #$langList = New-WinUserLanguageList sv-SE
    $langList = New-WinUserLanguageList en-US
    #$langList = New-WinUserLanguageList da
    #$langList = Get-WinUserLanguageList

   

    $langList[0].InputMethodTips.Clear()
    $langList[0].InputMethodTips.Add('041D:0000041D') # SE 041D:0000041D
    $langList[0].InputMethodTips.Add('0409:00000409') #US 0409:00000409

foreach ($La in $langList)
   {
   
       foreach ($imt in $La.InputMethodTips)
       {
    
        $imt

        }
   }

    Set-WinUserLanguageList $langList -Force


    Echo "Get list:"
    Get-WinUserLanguageList[0].InputMethodTips[0]
    #$langList[0].InputMethodTips[1]
    #$langList[1].InputMethodTips[0]
    #$langList[0].InputMethodTips[3]



    
    # Show as left
    Get-WinUserLanguageList

    
    
    # Disable hotkeys for switching input layout/language
    #====================================================
    #$HKCUInputMethodHotKeys104 = 'HKCU:\Control Panel\Input Method\Hot Keys\00000104'
    #Remove-Item -Path $HKCUInputMethodHotKeys104 -Recurse -ErrorAction 'SilentlyContinue'

    #$HKCUKeyboardLayoutToggle = 'HKCU:\Keyboard Layout\Toggle\'
    #Set-ItemProperty -Path $HKCUKeyboardLayoutToggle -Name 'Language Hotkey' -Value 3
    #Set-ItemProperty -Path $HKCUKeyboardLayoutToggle -Name 'Layout Hotkey' -Value 3
    #Set-ItemProperty -Path $HKCUKeyboardLayoutToggle -Name 'Hotkey' -Value 3


} else {
    # Windows 7 or lower
    $HKCUKeyboardPreload = 'HKCU:\Keyboard Layout\Preload'
    $HKCUKeyboardSubstitutes = 'HKCU:\Keyboard Layout\Substitutes'
    Remove-ItemProperty $HKCUKeyboardPreload -Name (Get-Item $HKCUKeyboardPreload).Property    # Remove all (dumb?) 
    Remove-ItemProperty $HKCUKeyboardSubstitutes -Name (Get-Item $HKCUKeyboardSubstitutes).Property
    Set-ItemProperty -path $HKCUKeyboardPreload -name '1' -value '00000416'
    Set-ItemProperty -path $HKCUKeyboardPreload -name '2' -value '00000409'
    Set-ItemProperty -path $HKCUKeyboardSubstitutes -name '00000409' -value '00020409'
    Set-ItemProperty -path $HKCUKeyboardSubstitutes -name '00000416' -value '00010416'
}
