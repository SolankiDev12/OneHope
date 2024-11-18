Write-Host "Analyzing disk usage..." -ForegroundColor Green

# Check and display disk usage
Get-PSDrive | Where-Object { $_.Provider -eq "FileSystem" } | 
    Format-Table Name, @{Name="Free (GB)"; Expression={ $_.Free / 1GB }}, 
                  @{Name="Used (GB)"; Expression={ ($_.Used / 1GB) }}, 
                  @{Name="Total (GB)"; Expression={ $_.Used + $_.Free / 1GB }}
