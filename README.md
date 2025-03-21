# Rectron

🚀 Advanced recon automation script for bug bounty hunters and security researchers.

Rectron is a modular and customizable Bash-based toolkit that automates the entire recon process — from subdomain enumeration to vulnerability scanning — using the best open-source tools in the game.

---

## 🔥 Features

- 🧠 Passive & Active Subdomain Enumeration
- 🌐 Live Host Detection & Port Scanning
- 🕵️ Subdomain Takeover Checks (Subjack)
- 📂 JS File Scraping & Endpoint Extraction
- 🧪 Param Fuzzing via Arjun
- ⚡ Vulnerability Scanning with Nuclei
- 📥 Historical URL Collection (gau + waybackurls)
- 🧬 GF Pattern Extraction (XSS, SQLi, etc.)
- 🛠️ Modular CLI Flags for Quick, Focused Scans

---

## 🧱 Requirements

Make sure Go is installed and your `$GOPATH` is configured. Then run:

```bash
./install_rectron_tools.sh
```
This script installs all dependencies

🚀 Usage
🔧 Make it executable:
```bash
chmod +x rectron_plus.sh
```

🎯 Basic Commands:
```bash
./rectron_plus.sh -d example.com --full        # Full scan
./rectron_plus.sh -d example.com --quick       # Subdomain + live check only
./rectron_plus.sh -d example.com --nuclei      # Nuclei scans only
./rectron_plus.sh -d example.com --js-scan     # JS scraping only
./rectron_plus.sh -d example.com --arjun       # Param fuzzing only
./rectron_plus.sh -d example.com --takeover    # Subdomain takeover check
```
🧩 CLI Flags
Option	Description
-d	(Required) Target domain to scan
--quick	Subdomains + live host check
--full	Full recon scan (default if no flag given)
--nuclei	Run Nuclei scans only
--js-scan	Scrape JS files and extract endpoints
--arjun	Run parameter fuzzing with Arjun
--takeover	Check for subdomain takeovers using Subjack
--help	Show usage instructions



