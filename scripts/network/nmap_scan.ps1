param(
    [string]$target
)

if (-not $target) {
    Write-Host "Usage: nmap_scan.ps1 -target <IP/Hostname>" -ForegroundColor Yellow
    exit
}

Write-Host "Performing network scan on $target..." -ForegroundColor Green

# Example logic (replace with actual scanning logic or invoke external tools)
$nmapResult = "Nmap Scan Results for $target: Open Ports - 22, 80, 443"
Write-Host $nmapResult
