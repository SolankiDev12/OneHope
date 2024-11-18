Here’s the updated README file for the **OneHope - Digital Forensics Toolkit** tailored for Kali Linux, removing the PowerShell and Windows-specific elements and adapting it for Linux-based systems:

---

### **OneHope - Digital Forensics Toolkit**

Welcome to **OneHope**, a comprehensive toolkit for digital forensics, designed to streamline network, log, process, and memory analysis. This README provides all the necessary steps to set up and use the toolkit on Kali Linux.

---

### **Features**
- **Script Generation**: Generate category-specific scripts for network, process, memory, and disk analysis.
- **Tool Integration**: Includes commands for tools like `nmap` and log analyzers.
- **Modular Design**: Easily extendable to incorporate new tools and commands.
- **Simplified Setup**: Automated installation process using `requirements.txt`.

---

### **Requirements**
Before proceeding with the setup, ensure the following prerequisites are installed:

1. **Git** – For cloning the repository.
   - Install Git:
     ```bash
     sudo apt install git
     ```

2. **Required Tools** – `nmap`, `traceroute`, `goaccess`, `logwatch`, and other required packages listed in `requirements.txt`.

   - Install all tools by running:
     ```bash
     sudo apt update
     sudo apt install -y nmap traceroute goaccess logwatch
     ```

3. **Python 3** – Required for running scripts.
   - Install Python 3:
     ```bash
     sudo apt install python3 python3-pip
     ```

4. **Dependencies** – Install the Python dependencies listed in `requirements.txt`:
   - Run the following command:
     ```bash
     pip3 install -r requirements.txt
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
Install the necessary tools and dependencies by running the following:
```bash
./install-requirements.sh
```
This script will:
- Install necessary tools (`nmap`, `traceroute`, `goaccess`, `logwatch`).
- Install Python dependencies from `requirements.txt`.

#### **Step 3: Install OneHope**
Execute the `install.sh` script to set up the toolkit:
```bash
./install.sh
```
What this script does:
- Copies toolkit files to `/opt/OneHope`.
- Creates symbolic links for easy access to scripts.
- Adds `onehope` command to the system PATH.

> **Note**: You might need to run the script as `sudo` if permission issues arise.

---

### **Usage**

After installation, you can use the `onehope` command to run different scripts and tools.

#### **General Help**
Display the main help menu:
```bash
onehope help
```

#### **Tool Help**
Get help for a specific tool (e.g., `nmap`):
```bash
onehope help nmap
```

#### **Generate Scripts**
Generate scripts for a specific category:
```bash
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
  ```bash
  onehope nmap scan [ip]
  onehope nmap service [ip]
  ```
- **Log Analysis**:  
  ```bash
  onehope log parse [file]
  onehope log search [term]
  ```

---

### **Updating OneHope**
To update the toolkit or dependencies:
1. Update `requirements.txt` as needed.
2. Re-run the installation scripts:
   ```bash
   ./install-requirements.sh
   ./install.sh
   ```

---

### **Contributing**
We welcome contributions to improve OneHope! Please submit a pull request or open an issue for suggestions or bug fixes.

---

### **Troubleshooting**
- **Issue**: `onehope` command not found.  
  **Solution**: Ensure the toolkit is added to the system PATH. Restart your terminal after installation.

- **Issue**: Tools not installed.  
  **Solution**: Verify that all tools listed in `requirements.txt` are installed. Re-run the `install-requirements.sh` script to resolve any missing tools.

---

### **License**
OneHope is licensed under the MIT License. See `LICENSE` for details.

---

### **Acknowledgments**
Special thanks to the open-source community for providing tools and resources that power the OneHope toolkit.

---

### Changes Made:
- Replaced PowerShell-specific instructions with Linux-compatible Bash commands.
- Removed Windows tools (Chocolatey, PowerShell) and focused on Kali Linux-specific tools and package managers (`apt`).
- Updated setup steps to reflect the Linux installation process.

With this updated README, you should be able to set up and run the OneHope toolkit efficiently on Kali Linux.