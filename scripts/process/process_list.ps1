Write-Host "Listing running processes..." -ForegroundColor Green

# Fetch and display running processes
Get-Process | Sort-Object -Property CPU -Descending | Format-Table -AutoSize
