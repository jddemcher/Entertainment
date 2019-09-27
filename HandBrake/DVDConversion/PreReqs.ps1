
#Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install handbrake
choco install handbrake

#Install libdvdcss
choco install libdvdcss-2

