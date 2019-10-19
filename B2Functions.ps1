
Function Get-NeglectedFiles

{

 Param([string[]]$path,

       [int]$numberDays)

 $cutOffDate = (Get-Date).AddDays(-$numberDays)

 Get-ChildItem -Path $path |  Where-Object {$_.LastAccessTime -le $cutOffDate}

}



function Get-NewPix
{
  $start = Get-Date -Month 1 -Day 1 -Year 2019
  $allpix = Get-ChildItem -Path $env:UserProfile\*.jpg -Recurse
  $allpix | Where-Object {$_.LastWriteTime -gt $Start}
}


function Hello
{
  "Hello from B2Functions"
}

function Hello2
{
  "Hello 2 from B2Functions"
}


function B2service
{
  $serv = Get-service -name b*
  #$serv | Where-Object {$_.Name *}
  
  $serv

}


function B2ListFolder ($path)

{
 get-childitem -name $path | select -Property PSChildName, Length

}

function B2ListFolder2 ($path)
{
 Get-ChildItem $path -recurse | where-object {$_.length -gt 200000000} | Sort-Object length
 
}

function B2ListFolder3 ($path)
{
 Get-ChildItem $path -recurse | where-object {$_.length -lt 200000000} | select -Property DirectoryName, PSChildName ,Length  |Sort-Object length
}




