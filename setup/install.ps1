# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "Please run this script as Administrator" -ForegroundColor Red
    exit
}

# Create the OneHope directory in Program Files
$installPath = "$env:ProgramFiles\OneHope"
New-Item -ItemType Directory -Force -Path $installPath

# Copy all scripts to installation directory
Copy-Item -Path ".\scripts" -Destination $installPath -Recurse -Force
Copy-Item -Path ".\tools" -Destination $installPath -Recurse -Force

# Add OneHope to system PATH
$systemPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if ($systemPath -notlike "*$installPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$systemPath;$installPath", [EnvironmentVariableTarget]::Machine)
}

# Copy onehope.ps1 to a location in PATH
Copy-Item -Path ".\setup\onehope.ps1" -Destination "$installPath\onehope.ps1" -Force

# Create a function to add to PowerShell profile
$profileContent = @"
function onehope {
    & "$installPath\onehope.ps1" `$args
}
"@

# Add the function to PowerShell profile
if (!(Test-Path $PROFILE)) {
    New-Item -Path $PROFILE -Type File -Force
}
Add-Content -Path $PROFILE -Value $profileContent

Write-Host "Installation completed successfully!" -ForegroundColor Green
Write-Host "Please restart PowerShell to use the 'onehope' command." -ForegroundColor Yellow