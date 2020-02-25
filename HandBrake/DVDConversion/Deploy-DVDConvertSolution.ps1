Param (
[string]$RootPath = "C:\Users\baby yoda\Desktop\Entertainment-master\Entertainment-master\HandBrake\DVDConversion", #path where you downloaded this zip package
[string]$ContentDir = "C:\Users\baby yoda\Desktop\Entertainment-master\Entertainment-master\HandBrake\DVDConversion"
)

$HomeFolder = "C:\ProgramData\CustomScripts"
If (!(Test-Path -Path $HomeFolder)){
    New-Item -Path "C:\ProgramData\" -ItemType Directory -Name "CustomScripts"
}

$Scripts = Get-ChildItem -Path $RootPath -Recurse
Copy-Item -Path $Scripts -Destination $HomeFolder -Force

powershell.exe -File "$HomeFolder\PreReqs.ps1"

$CheckScript = "$HomeFolder\Check-DVDRom.ps1"
$CheckParams = "-File '$CheckScript'"
$ConvertScript = "$HomeFolder\Convert-DVD.ps1"
$ConvertParams = "-File '$ConvertScript' -DestinationDirectory '$ContentDir'"

[xml]$checkXmlRaw = Get-Content -Path ".\CheckDVDRom.xml"
$checkXmlRaw.Task.Actions.Exec.Arguments = $CheckParams
$checkXml = $checkXmlRaw.OuterXml

[xml]$convertXmlRaw = Get-Content  -Path ".\ConvertDVD.xml"
$convertXmlRaw.Task.Actions.Exec.Arguments = $ConvertParams
$convertXml = $convertXmlRaw.OuterXml

Register-ScheduledTask -Xml $checkXml -TaskName 'Check-DVDRom'
Register-ScheduledTask -Xml $convertXml -TaskName 'Convert-DVD'