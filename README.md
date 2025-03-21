# ⚡ Rectron

**Advanced Recon Automation Toolkit** for bug bounty hunters, red teamers, and ethical hackers.

Rectron combines the most powerful open-source recon tools into one modular, CLI-based Bash script — giving you fast, flexible, and focused recon capabilities.

---

## 🧠 Features

- 🔍 Passive & Active Subdomain Enumeration
- 🌐 Live Host Detection + Fast Port Scanning
- 💥 Subdomain Takeover Detection (Subjack)
- 📜 JavaScript File Scraping + Endpoint Extraction
- 🧪 Hidden Parameter Discovery (Arjun)
- 🧬 Vulnerability Scanning (Nuclei with multiple template sets)
- 📥 Historical URL Harvesting (gau + waybackurls)
- 📊 GF Pattern Extraction (XSS, SQLi, etc.)
- 🔘 Modular CLI Support — only run what you need!

---

## 🛠️ Install All Required Tools

Clone the repo and run the tool installer:

```bash
git clone https://github.com/atulxerma/rectron.git
cd rectron
chmod +x install_rectron_tools.sh
./install_rectron_tools.sh
```

This script installs all dependencies including:

- `amass`
- `subfinder`
- `assetfinder`
- `httpx`
- `nuclei`
- `subjack`
- `naabu`
- `gau`
- `waybackurls`
- `getJS`
- `arjun`
- `gf`

---

## 🚀 Usage

### 🔧 Make the script executable:
```bash
chmod +x rectron.sh
```

### 🎯 Run Rectron:
```bash
./rectron.sh -d example.com --full         # Full recon scan
./rectron.sh -d example.com --quick        # Subdomains + live check only
./rectron.sh -d example.com --nuclei       # Nuclei scans only
./rectron.sh -d example.com --js-scan      # JS scraping & endpoint extraction
./rectron.sh -d example.com --arjun        # Parameter fuzzing with Arjun
./rectron.sh -d example.com --takeover     # Subdomain takeover detection
```

---

## 🧩 CLI Flags

| Flag            | Description                                     |
|------------------|-------------------------------------------------|
| `-d`             | **(Required)** Target domain to scan            |
| `--quick`        | Run subdomain enum + live host detection only   |
| `--full`         | Run the full recon suite (default mode)         |
| `--nuclei`       | Run Nuclei scans only                           |
| `--js-scan`      | Run JavaScript scraping and endpoint extraction |
| `--arjun`        | Run parameter fuzzing using Arjun               |
| `--takeover`     | Run subdomain takeover checks only              |
| `--help`         | Display help/usage information                  |

---

## 📁 Output Structure

All results are saved in:

```
output/<domain>_<timestamp>/
```

Organized like this:

| Folder            | Contents                                       |
|-------------------|------------------------------------------------|
| `targets/`        | Subdomains, live hosts, port scans             |
| `nuclei/`         | Nuclei vulnerability scan results              |
| `js/`             | JavaScript files and extracted endpoints       |
| `gf/`             | GF pattern matches (XSS, SQLi, etc.)           |
| `paramscan/`      | Arjun parameter discovery output               |
| `logs/`           | Tool logs (optional for debugging)             |

---

## 📜 License

This project is licensed under the **MIT License** — you're free to use, modify, and share with attribution.

```
MIT License

Copyright (c) 2025 @atulxerma
