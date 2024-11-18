# OneHope - Digital Forensics Toolkit

Quick-access toolkit for digital forensics and security tools.

## Directory Structure
```
OneHope/
├── setup/
│   ├── install.ps1
│   └── onehope.ps1
├── tools/
│   └── commands/
└── scripts/
    ├── network/
    ├── process/
    ├── memory/
    └── disk/
```

## Installation (Windows)

1. Clone the repository:
```powershell
git clone https://github.com/YOUR_USERNAME/OneHope.git
cd OneHope
```

2. Run the installation script:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup\install.ps1
```

3. Restart PowerShell and run:
```powershell
onehope
```

## Usage

```powershell
# Get general help
onehope

# Get tool-specific commands
onehope help nmap
onehope help log

# Generate scripts
onehope scripts process
```

## Available Tools

* Nmap commands
* Log analysis tools
* Process analysis scripts
* More coming soon...

## Features

- Network analysis tools
- Process monitoring
- Memory analysis
- Disk forensics
- Custom script generation

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.