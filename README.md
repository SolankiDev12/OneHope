### **OneHope - Digital Forensics Toolkit**

Welcome to **OneHope**, a comprehensive toolkit for digital forensics, designed to streamline network, log, process, and memory analysis. This README provides all the necessary steps to set up and use the toolkit.

---

### **Features**
- **Script Generation**: Generate category-specific scripts for network, process, memory, and disk analysis.
- **Tool Integration**: Includes commands for tools like `nmap` and log analyzers.
- **Modular Design**: Easily extendable to incorporate new tools and commands.
- **Simplified Setup**: Automated installation process using `requirements.txt`.

---

### **Requirements**
Before proceeding with the setup, ensure the following prerequisites are installed:

1. **PowerShell** (5.1 or higher)
2. **Chocolatey** (for managing external tools)
   - Install Chocolatey: 
     ```powershell
     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
     ```

---

### **Setup Instructions**

#### **Step 1: Clone the Repository**
Download or clone the OneHope project to your local system:
```bash
git clone https://github.com/yourusername/onehope.git
cd onehope
```

#### **Step 2: Install Requirements**
Run the `install-requirements.ps1` script to install all dependencies listed in `requirements.txt`:
```powershell
.\install-requirements.ps1
```

This script will:
- Install PowerShell modules (e.g., `PSScriptAnalyzer`, `Pester`).
- Install external tools (e.g., `Nmap`, `SysinternalsSuite`) via Chocolatey.

#### **Step 3: Install OneHope**
Execute the `install.ps1` script to set up the toolkit:
```powershell
.\install.ps1
```

What this script does:
- Copies toolkit files to `C:\Program Files\OneHope`.
- Adds `onehope.ps1` to your system PATH for easy access.
- Updates your PowerShell profile to include a `onehope` function.

> **Note**: You must run this script as an Administrator.

---

### **Usage**

After installation, restart PowerShell to activate the `onehope` command. Use it as follows:

#### **General Help**
Display the main help menu:
```powershell
onehope help
```

#### **Tool Help**
Get help for a specific tool (e.g., `nmap`):
```powershell
onehope help nmap
```

#### **Generate Scripts**
Generate scripts for a specific category:
```powershell
onehope scripts [category]
```
Available categories:
- `network`
- `process`
- `memory`
- `disk`

#### **Tool Commands**
Example commands for built-in tools:
- **Nmap**:  
  ```powershell
  onehope nmap scan [ip]
  onehope nmap service [ip]
  ```
- **Log Analysis**:  
  ```powershell
  onehope log parse [file]
  onehope log search [term]
  ```

---

### **Updating OneHope**
To update the toolkit or dependencies:
1. Update `requirements.txt` as needed.
2. Re-run the installation scripts:
   ```powershell
   .\install-requirements.ps1
   .\install.ps1
   ```

---

### **Contributing**
We welcome contributions to improve OneHope! Please submit a pull request or open an issue for suggestions or bug fixes.

---

### **Troubleshooting**
- **Issue**: `onehope` command not found.  
  **Solution**: Ensure the toolkit is added to the system PATH. Restart PowerShell after installation.
  
- **Issue**: Chocolatey tools not installed.  
  **Solution**: Verify that Chocolatey is installed and in the PATH.

---

### **License**
OneHope is licensed under the MIT License. See `LICENSE` for details.

---

### **Acknowledgments**
Special thanks to the open-source community for providing tools and resources that power the OneHope toolkit.