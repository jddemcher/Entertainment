Do {
    $MediaLoaded = (get-wmiobject -class win32_cdromdrive -Property MediaLoaded).MediaLoaded
    Start-Sleep -Seconds 15
}
Until ($MediaLoaded -eq $true)

Get-ScheduledTask -TaskName 'Convert-DVD' | Start-ScheduledTask
