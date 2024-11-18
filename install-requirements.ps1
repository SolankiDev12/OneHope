# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "Please run this script as Administrator" -ForegroundColor Red
    exit
}

# Read the requirements.txt file
$requirementsFile = "requirements.txt"
if (!(Test-Path $requirementsFile)) {
    Write-Host "Error: requirements.txt not found in the current directory." -ForegroundColor Red
    exit
}

# Loop through each line in requirements.txt
Get-Content $requirementsFile | ForEach-Object {
    $tool = $_.Trim()
    if (-not $tool) { return }

    switch -Wildcard ($tool) {
        "PSScriptAnalyzer" {
            Write-Host "Installing PowerShell module: $tool" -ForegroundColor Green
            Install-Module -Name PSScriptAnalyzer -Force -Scope AllUsers
        }
        "Pester" {
            Write-Host "Installing PowerShell module: $tool" -ForegroundColor Green
            Install-Module -Name Pester -Force -Scope AllUsers
        }
        "Nmap" {
            Write-Host "Installing $tool (requires Chocolatey)" -ForegroundColor Green
            choco install nmap -y
        }
        "SysinternalsSuite" {
            Write-Host "Installing $tool (requires Chocolatey)" -ForegroundColor Green
            choco install sysinternals -y
        }
        "LogParser" {
            Write-Host "Installing $tool (requires Chocolatey)" -ForegroundColor Green
            choco install logparser -y
        }
        default {
            Write-Host "Unknown requirement: $tool" -ForegroundColor Yellow
        }
    }
}

Write-Host "All requirements installed successfully!" -ForegroundColor Cyan
