# ping.ps1
param (
    [string]$target = "8.8.8.8"
)

Write-Host "Pinging $target..."
Test-Connection -ComputerName $target -Count 4
