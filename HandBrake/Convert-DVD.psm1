<#
.SYNOPSIS
Function to programmatically convert ISO video files into mp4

.DESCRIPTION
Function to programmatically convert ISO video files into mp4 using Handbrake CLI

.EXAMPLE
Convert-DVD -inputDir C:\Media\CREED\CREED.ISO -outputDir C:\Media\CREED\Creed.mp4

#>

Function Convert-DVD {
param(
    $inputDir,
    $outputDir
)

$Arguments = @"
-i $inputDir -o $outputDir --main-feature
"@

    $CLIPath = "C:\Program Files\HandBrake\HandBrakeCLI.exe"

Start-Job -ScriptBlock {param($Arguments,$CLIPath) Start-Process -FilePath $CLIPath -ArgumentList $Arguments -Wait} -Name HandBrake -ArgumentList $Arguments,$CLIPath

}