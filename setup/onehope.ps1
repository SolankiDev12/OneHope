param(
    [string]$command = "help",
    [string]$tool = "",
    [string]$subcommand = ""
)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$scriptsPath = Join-Path $scriptPath "scripts"
$toolsPath = Join-Path $scriptPath "tools"

function Show-MainHelp {
    Write-Host "OneHope - Digital Forensics Toolkit" -ForegroundColor Cyan
    Write-Host "Usage: onehope [command] [tool] [subcommand]`n"
    Write-Host "Available Commands:"
    Write-Host "  help [tool]        - Show help for specific tool"
    Write-Host "  scripts [category] - Generate scripts (network/process/memory/disk)"
    Write-Host "`nAvailable Tools:"
    Get-ChildItem -Path $toolsPath -Filter "*.ps1" |
        ForEach-Object { Write-Host "  $($_.BaseName)" }
}

function Show-ToolHelp {
    param([string]$toolName)

    $toolFile = Join-Path $toolsPath "$toolName.ps1"
    if (Test-Path $toolFile) {
        Write-Host "$toolName Tool Commands:" -ForegroundColor Cyan
        & $toolFile -help
    } else {
        Write-Host "Tool '$toolName' not found. Use 'onehope help' for available tools." -ForegroundColor Red
    }
}

function Generate-Scripts {
    param([string]$category)

    $categoryPath = Join-Path $scriptsPath $category
    if (!(Test-Path $categoryPath)) {
        Write-Host "Invalid category. Available categories: network, process, memory, disk" -ForegroundColor Red
        return
    }

    Write-Host "Generating scripts for category: $category..." -ForegroundColor Green
    # Invoke script generation logic for each script in the category folder
    Get-ChildItem -Path $categoryPath -Filter "*.ps1" | ForEach-Object {
        & $_.FullName
    }
}

# Main command processing
switch ($command.ToLower()) {
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
        Write-Host "Invalid command: $command. Use 'help' to see available commands." -ForegroundColor Red
        Show-MainHelp
    }
}
