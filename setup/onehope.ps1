param(
    [string]$command = "help",
    [string]$tool = "",
    [string]$subcommand = ""
)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

function Show-MainHelp {
    Write-Host "OneHope - Digital Forensics Toolkit" -ForegroundColor Cyan
    Write-Host "Usage: onehope [command] [tool] [subcommand]`n"
    Write-Host "Available Commands:"
    Write-Host "  help [tool]        - Show help for specific tool"
    Write-Host "  scripts [category] - Generate scripts (network/process/memory/disk)"
    Write-Host "`nAvailable Tools:"
    Write-Host "  nmap    - Network mapping and scanning commands"
    Write-Host "  log     - Log analysis tools"
    Write-Host "  process - Process analysis tools"
}

function Show-ToolHelp {
    param([string]$toolName)
    
    switch ($toolName) {
        "nmap" {
            Write-Host "Nmap Tool Commands:" -ForegroundColor Cyan
            Write-Host "  onehope nmap scan [ip]     - Basic network scan"
            Write-Host "  onehope nmap service [ip]  - Service detection"
        }
        "log" {
            Write-Host "Log Analysis Commands:" -ForegroundColor Cyan
            Write-Host "  onehope log parse [file]   - Parse log file"
            Write-Host "  onehope log search [term]  - Search in logs"
        }
        default {
            Write-Host "Tool not found. Use 'onehope help' for available tools." -ForegroundColor Red
        }
    }
}

function Generate-Scripts {
    param([string]$category)
    
    $scriptsPath = Join-Path $scriptPath "scripts\$category"
    if (!(Test-Path $scriptsPath)) {
        Write-Host "Invalid category. Available categories: network, process, memory, disk" -ForegroundColor Red
        return
    }
    
    Write-Host "Generating $category scripts..." -ForegroundColor Green
    # Add script generation logic here
}

# Main command processing
switch ($command) {
    "help" {
        if ($tool) {
            Show-ToolHelp $tool
        } else {
            Show-MainHelp
        }
    }
    "scripts" {
        if ($tool) {
            Generate-Scripts $tool
        } else {
            Write-Host "Please specify a category: network, process, memory, disk" -ForegroundColor Yellow
        }
    }
    default {
        Show-MainHelp
    }
}