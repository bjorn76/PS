#B2_Review_Screen_Resolution.ps1
# Selected parts from
# https://www.reddit.com/r/PowerShell/comments/6ob5tt/setdisplayresolution_on_multiple_monitors/
# B2: 2018-10-20 

# .net style
cls
$screen1 = [System.Windows.Forms.Screen]::PrimaryScreen
$height1 = $screen.bounds.Size.Width
$width1 = $screen.bounds.Size.Height

$screen2 = [System.Windows.Forms.Screen]::SeconderyScreen
$height2 = $screen.bounds.Size.Width
$width2 = $screen.bounds.Size.Height

Write-output ("Primary   Screen: " + $width1 + " x "  + $height1)
Write-output ("Secondary Screen: " + $width2 + " x "  + $height2)

