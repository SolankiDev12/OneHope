param(
    [string]$logFile
)

if (-not $logFile -or !(Test-Path $logFile)) {
    Write-Host "Usage: log_parser.ps1 -logFile <Path to Log File>" -ForegroundColor Yellow
    exit
}

Write-Host "Parsing log file $logFile..." -ForegroundColor Green

# Example log parsing logic
Get-Content $logFile | Select-String -Pattern "ERROR|WARN" | 
    ForEach-Object { Write-Host $_ -ForegroundColor Red }
