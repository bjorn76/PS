#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6&viewFallbackFrom=powershell-Microsoft.PowerShell.Core


$yes = ''
$yes= Read-host 'Type yes ot enable PS script.'
if ($yes -like "*yes*") {
  Write-Host -ForegroundColor Cyan 'ExecutionPolicy as found:'
  Get-ExecutionPolicy -List | Out-Host

  #Set-ExecutionPolicy Undefined       # Undefined will disable script excecution
  Set-ExecutionPolicy Unrestricted     # Unrestricted will enable script excecution
  Write-Output ''
  Write-Host -ForegroundColor Cyan 'ExecutionPolicy as left:'
  Get-ExecutionPolicy -List | Out-Host

}



