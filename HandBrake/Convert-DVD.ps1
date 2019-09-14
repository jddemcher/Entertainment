
#Find DVD drive
$DVDRom = Get-CimInstance -ClassName win32_logicaldisk | Where-Object {$_.DriveType -eq 5}
$Title = $DVDRom.VolumeName
$FileName = $Title + ".mp4"
$inputDir = $DVDRom.DeviceID + "\"
$output = "$ENV:USERPROFILE\Downloads\" + $FileName

$Arguments = @"
-i $inputDir -o $output --main-feature
"@

$CLIPath = "C:\Program Files\HandBrake\HandBrakeCLI.exe"

Start-Job -ScriptBlock {param($Arguments,$CLIPath) Start-Process -FilePath $CLIPath -ArgumentList $Arguments -Wait} -Name HandBrake -ArgumentList $Arguments,$CLIPath

Get-Job | Wait-Job

$NAS = "\\10.5.0.200\media\Movie Library\"

$Destination = "$NAS" + "$Title"

If (!(Test-Path -Path $Destination)) {
    New-Item -ItemType Directory -Path $NAS -Name $Title | Out-Null
}

Move-Item -Path $output -Destination $Destination -Force