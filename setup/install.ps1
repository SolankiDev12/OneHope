# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "Please run this script as Administrator" -ForegroundColor Red
    exit
}

# Define installation path
$installPath = "$env:ProgramFiles\OneHope"

# Check if already installed
if (Test-Path $installPath) {
    Write-Host "OneHope is already installed at $installPath" -ForegroundColor Yellow
    Write-Host "Reinstalling..."
    Remove-Item -Recurse -Force -Path $installPath
}

# Create the OneHope directory in Program Files
try {
    New-Item -ItemType Directory -Force -Path $installPath | Out-Null
    Write-Host "Created installation directory: $installPath" -ForegroundColor Green
} catch {
    Write-Host "Failed to create installation directory: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

# Copy all scripts and tools to installation directory
try {
    Copy-Item -Path ".\scripts" -Destination $installPath -Recurse -Force
    Copy-Item -Path ".\tools" -Destination $installPath -Recurse -Force
    Write-Host "Copied scripts and tools to $installPath" -ForegroundColor Green
} catch {
    Write-Host "Failed to copy files: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

# Add OneHope to system PATH
$systemPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if ($systemPath -notlike "*$installPath*") {
    try {
        [Environment]::SetEnvironmentVariable("Path", "$systemPath;$installPath", [EnvironmentVariableTarget]::Machine)
        Write-Host "Added $installPath to system PATH" -ForegroundColor Green
    } catch {
        Write-Host "Failed to add OneHope to system PATH: $($_.Exception.Message)" -ForegroundColor Red
        exit
    }
} else {
    Write-Host "$installPath is already in system PATH" -ForegroundColor Yellow
}

# Copy onehope.ps1 to installation directory
try {
    Copy-Item -Path ".\setup\onehope.ps1" -Destination "$installPath\onehope.ps1" -Force
    Write-Host "Copied onehope.ps1 to $installPath" -ForegroundColor Green
} catch {
    Write-Host "Failed to copy onehope.ps1: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

# Create the function in PowerShell profile
$profileContent = @"
function onehope {
    & "$installPath\onehope.ps1" `$args
}
"@

try {
    if (!(Test-Path $PROFILE)) {
        New-Item -Path $PROFILE -Type File -Force | Out-Null
        Write-Host "Created PowerShell profile at $PROFILE" -ForegroundColor Green
    }

    # Avoid adding duplicate function definitions
    if ((Get-Content $PROFILE) -notmatch "function onehope") {
        Add-Content -Path $PROFILE -Value $profileContent
        Write-Host "Added 'onehope' command to PowerShell profile" -ForegroundColor Green
    } else {
        Write-Host "'onehope' function already exists in the PowerShell profile" -ForegroundColor Yellow
    }
} catch {
    Write-Host "Failed to modify PowerShell profile: $($_.Exception.Message)" -ForegroundColor Red
    exit
}

Write-Host "Installation completed successfully!" -ForegroundColor Green
Write-Host "Please restart PowerShell to use the 'onehope' command." -ForegroundColor Yellow
