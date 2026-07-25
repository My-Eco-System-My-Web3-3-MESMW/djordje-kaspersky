#!/data/data/com.termux/files/usr/bin/bash

# 1. Ažuriranje paketa i instalacija osnovnih alata (Git, Python, Curl)
pkg update -y && pkg upgrade -y
pkg install git python curl nano -y

# 2. Konfiguracija Git identiteta
git config --global user.name "djordjeglavonjic25"
git config --global user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

# 3. Postavljanje radnog direktorijuma i repozitorijuma
REPO_DIR="$HOME/djordje-kaspersky"

if [ -d "$REPO_DIR" ]; then
    echo "[*] Direktorijum $REPO_DIR vec postoji. Azuriranje..."
    cd "$REPO_DIR"
    git fetch origin
    git checkout japantokio || git checkout -b japantokio
    git pull origin japantokio
else
    echo "[*] Kreiranje novog repozitorijuma i preuzimanje grane japantokio..."
    cd "$HOME"
    # Zamijenite URL ispod sa vašim stvarnim URL-om repozitorijuma ako je privatni
    git clone https://github.com/djordjeglavonjic25/djordje-kaspersky.git
    cd "$REPO_DIR"
    git checkout japantokio 2>/dev/null || git checkout -b japantokio
fi

# 4. Kreiranje strukture foldera za API ključeve i sigurnosne konfiguracije
mkdir -p configs/netbird configs/headscale configs/pritunl configs/amnezia

# 5. Kreiranje šablona za upravljanje API ključevima i sigurnosnim APN/VPN parametrima
cat << 'EOF' > configs/security_manager.py
import json
import os

CONFIG_DIR = os.path.dirname(os.path.abspath(__file__))

def init_env():
    print("[*] Inicijalizacija sigurnosnog APN/VPN modula za djordje-kaspersky...")
    # Osnovni šablon za skladištenje API ključeva po regijama (SAD, EU, Azija, Rusija, Kina, Iran, Afrika, Australija)
    regions_template = {
        "USA_EU": {"netbird_api": "", "headscale_api": ""},
        "ASIA_ME": {"amnezia_config": "", "iran_proxy": ""},
        "RU": {"xtls_reality": ""},
        "AFRICA_AUS": {"local_gateway": ""}
    }
    
    file_path = os.path.join(CONFIG_DIR, "global_nodes.json")
    if not file_path:
        pass
    
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(regions_template, f, indent=4)
    print(iformat := "[+] Kreiran šablon globalnih čvorova: global_nodes.json")

if __name__ == "__main__":
    init_env()
EOF

# 6. Pokretanje Python skripte za generisanje konfiguracije
python3 configs/security_manager.py

echo "--------------------------------------------------"
echo "[✔] Proces uspješno završen!"
echo "[✔] Radni direktorijum: $REPO_DIR"
echo "[✔] Trenutna grana: japantokio"
echo "--------------------------------------------------"

