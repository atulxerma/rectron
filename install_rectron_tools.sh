#!/bin/bash

# =========================================
# Rectron Tool Installer
# Installs all dependencies for Rectron
# Author: @atulxerma
# =========================================

RED="\033[0;31m"; GREEN="\033[0;32m"; YELLOW="\033[1;33m"; NC="\033[0m"
LOGFILE="rectron-install.log"
touch "$LOGFILE"

echo -e "${YELLOW}[-] Installing dependencies for Rectron+${NC}"
echo -e "${YELLOW}[>] Logfile: $LOGFILE${NC}"
sleep 1

# Ensure Go is installed
if ! command -v go &> /dev/null; then
    echo -e "${RED}[!] Go not found. Installing Go...${NC}"
    sudo apt update && sudo apt install -y golang
fi

# Set up Go env if not already
if [ -z "$GOPATH" ]; then
    echo -e "${YELLOW}[*] Setting up Go environment...${NC}"
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
    source ~/.bashrc
fi

TOOLS=(
    "github.com/OWASP/Amass/v3/...@latest"
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    "github.com/tomnomnom/assetfinder@latest"
    "github.com/projectdiscovery/httpx/cmd/httpx@latest"
    "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
    "github.com/hakluke/hakrawler@latest"
    "github.com/LukaSikic/subjack@latest"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
    "github.com/lc/gau@latest"
    "github.com/1ndianl33t/getJS@latest"
    "github.com/sa7mon/waybackurls@latest"
    "github.com/s0md3v/Arjun@latest"
    "github.com/tomnomnom/gf@latest"
)

# Install Go-based tools
for tool in "${TOOLS[@]}"; do
    TOOLNAME=$(basename "$tool" | cut -d'@' -f1)
    if command -v "$TOOLNAME" &> /dev/null; then
        echo -e "${GREEN}[✓] $TOOLNAME already installed${NC}"
    else
        echo -e "${BLUE}[+] Installing: $TOOLNAME${NC}"
        go install "$tool" >> "$LOGFILE" 2>&1
    fi
done

# Setup GF patterns
if [ -d ~/.gf ]; then
    echo -e "${GREEN}[✓] GF directory exists${NC}"
else
    mkdir ~/.gf
fi
echo -e "${BLUE}[+] Installing GF patterns${NC}"
git clone https://github.com/1ndianl33t/Gf-Patterns.git >> "$LOGFILE" 2>&1
cp Gf-Patterns/*.json ~/.gf/
rm -rf Gf-Patterns

# Update PATH permanently
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
source ~/.bashrc

echo -e "${GREEN}[✓] All tools installed. You're Rectron-ready! 💥${NC}"
