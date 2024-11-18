param(
    [string]$pid
)

if (-not $pid) {
    Write-Host "Usage: process_analyzer.ps1 -pid <Process ID>" -ForegroundColor Yellow
    exit
}

Write-Host "Analyzing process with PID $pid..." -ForegroundColor Green

# Example process analysis logic
try {
    $process = Get-Process -Id $pid
    Write-Host "Process Name: $($process.ProcessName)"
    Write-Host "CPU Usage: $($process.CPU)"
    Write-Host "Memory Usage: $($process.WorkingSet / 1MB) MB"
} catch {
    Write-Host "Process with PID $pid not found." -ForegroundColor Red
}
