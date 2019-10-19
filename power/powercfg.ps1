# Powrcfg demo
# https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/powercfg-command-line-options
cls
powercfg /list
#powercfg /?
$Active_pwr_guid = powercfg /getactivescheme
$Active_pwr_guid
#powercfg /export c:\b2\ps\power\pwrsetting1.pow 381b4222-f694-41f0-9685-ff5bb260df2e
C:\B2\ps\power\Set-Powerplan "Dockad"