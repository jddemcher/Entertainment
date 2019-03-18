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

    Start-Process $CLIPath -ArgumentList $Arguments

}