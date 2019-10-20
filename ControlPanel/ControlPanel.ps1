<#
File name      Purpose
-----------------------------------------------------------------------
Access.cpl     Accessibility properties
Appwiz.cpl     Add/Remove Programs properties
Desk.cpl       Display properties
FindFast.cpl   FindFast (included with Microsoft Office for Windows 95)
Inetcpl.cpl    Internet properties
Intl.cpl       Regional Settings properties
Joy.cpl        Joystick properties
Main.cpl       Mouse, Fonts, Keyboard, and Printers properties
Mlcfg32.cpl    Microsoft Exchange or Windows Messaging properties
Mmsys.cpl      Multimedia properties
Modem.cpl      Modem properties
Netcpl.cpl     Network properties
Odbccp32.cpl   Data Sources (32-bit ODBC, included w/ Microsoft Office)
Password.cpl   Password properties
Sticpl.cpl     Scanners and Cameras properties
Sysdm.cpl      System properties and Add New Hardware wizard
Themes.cpl     Desktop Themes 
TimeDate.cpl   Date/Time properties
Wgpocpl.cpl    Microsoft Mail Post Office

#>

<#



#>


# appwiz.cpl #opens "Programs and Features"
#Intl.cpl
# Desk.cpl
# Powercfg.cpl
# ncpa.cpl
# control /name Microsoft.AdministrativeTools
# firewall.cpl
# $env:windir
# SystemPropertiesAdvanced.exe
# sysdm.cpl
control /name Microsoft.PowerOptions /page pageGlobalSettings