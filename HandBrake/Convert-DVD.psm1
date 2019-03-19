<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
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

    cmd /c "'$CLIPath' $Arguments"
#Start-Job -ScriptBlock {Start-Process -FilePath 'C:\Program Files\HandBrake\HandBrakeCLI.exe' -ArgumentList '-i "C:\Media\GREEN BOOK" -o "C:\Green Book.mp4" --main-feature' -Wait} -Name HandBrake
}