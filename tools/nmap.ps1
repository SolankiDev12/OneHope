param(
    [string]$action,
    [string]$target
)

if (-not $action -or -not $target) {
    Write-Host "Usage: nmap.ps1 -action <scan/service> -target <IP/Hostname>" -ForegroundColor Yellow
    exit
}

switch ($action) {
    "scan" {
        Write-Host "Performing basic scan on $target..." -ForegroundColor Green
        # Replace with actual Nmap command or invoke system command
        Write-Host "Nmap Scan: Found open ports 22, 80, 443"
    }
    "service" {
        Write-Host "Performing service detection on $target..." -ForegroundColor Green
        # Replace with actual service detection logic
        Write-Host "Nmap Service Detection: HTTP, HTTPS, SSH running"
    }
    default {
        Write-Host "Invalid action. Use 'scan' or 'service'." -ForegroundColor Red
    }
}
