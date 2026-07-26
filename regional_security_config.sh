#!/data/data/com.termux/files/usr/bin/bash

# 1. Postavke direktorijuma i Git identiteta
REPO_DIR="$HOME/djordje-kaspersky"
cd "$REPO_DIR" || { echo "[!] Direktorijum $REPO_DIR nije pronađen!"; exit 1; }

git config --global user.name "djordjeglavonjic25"
git config --global user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

# 2. Kreiranje strukture za regionalne sigurnosne module
mkdir -p regional_configs/usa_eu regional_configs/asia_china_iran regional_configs/russia

# 3. Kreiranje Python skripte za upravljanje regionalnim APN/VPN parametrima i API ključevima
cat << 'EOF' > regional_configs/regional_manager.py
import json
import os

def generate_regional_configs():
    print("[*] Generisanje regionalnih sigurnosnih postavki...")
    
    config_data = {
        "usa_eu": {
            "focus": "Standardna sloboda protoka i Mesh VPN integracija",
            "recommended_tools": ["NetBird", "Pritunl"],
            "api_endpoint_template": "",
            "cloud_providers": ["AWS", "DigitalOcean", "Hetzner"]
        },
        "asia_china_iran": {
            "focus": "Zaobilaženje DPI cenzure i obfuskacija saobraćaja",
            "recommended_tools": ["Amnezia VPN"],
            "protocols": ["XRay/VLESS", "Cloak", "Amnezia WireGuard"],
            "api_endpoint_template": ""
        },
        "russia": {
            "focus": "Otpornost na Roskomnadzor blokade",
            "recommended_tools": ["3X-UI panel"],
            "protocols": ["XTLS-Reality", "Shadowsocks"],
            "api_endpoint_template": ""
        }
    }
    
    file_path = "regional_nodes.json"
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(config_data, f, indent=4)
        
    print(f"[+] Uspješno kreiran fajl: {file_path}")

if __name__ == "__main__":
    generate_regional_configs()
EOF

# 4. Izvršavanje Python skripte
echo "[*] Pokretanje generatora regionalnih konfiguracija..."
python3 regional_configs/regional_manager.py

# 5. Automatska sinhronizacija i push na GitHub (grana: japantokio)
echo "[*] Sinhronizacija izmjena sa GitHub-om..."
git checkout japantokio 2>/dev/null || git checkout -b japantokio
git add .
git commit -m "Auto-update: Dodate regionalne sigurnosne konfiguracije za USA, EU, Aziju i Rusiju"
git pull origin japantokio --rebase
git push origin japantokio

echo "--------------------------------------------------"
echo "[✔] Regionalni sigurnosni kodovi uspješno postavljeni i sinhronizovani!"
echo "[✔] Radni direktorijum: $REPO_DIR"
echo "--------------------------------------------------"
