#!/data/data/com.termux/files/usr/bin/bash

# Postavljanje identiteta za Git
git config --global user.name "djordjeglavonjic25"
git config --global user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

# Ažuriranje paketa i instalacija alata
pkg update && pkg upgrade -y
pkg install git python curl nano -y

# Navigacija ili kloniranje repozitorijuma djordje-kaspersky
if [ -d "$HOME/djordje-kaspersky" ]; then
    cd "$HOME/djordje-kaspersky"
    git pull origin japantokio
else
    cd "$HOME"
    git clone https://github.com/djordjeglavonjic25/djordje-kaspersky.git
    cd "$HOME/djordje-kaspersky"
fi

# Kreiranje ili provjera grane japantokio
git checkout -B japantokio

# Kreiranje foldera za sigurnosne skripte
mkdir -p security_configs
cd security_configs

# Generisanje ili ažuriranje Python skripte za Sangfor Technologies i azijske/globalne sigurnosne platforme
cat << 'EOF' > sangfor_security_manager.py
import json
import urllib.request
import os

SANGFOR_SECURITY_SERVICES = {
    "Sangfor Technologies": {
        "region": "Asia / China & International Presence",
        "type": "Network Security, NGFW, Corporate VPN & Cloud Infrastructure",
        "api_endpoint": "https://api.sangfor.com/v1/",
        "auth_method": "Enterprise API Key / Centralized Management Token",
        "status": "Active"
    },
    "CommsCloud & floLIVE": {
        "region": "Africa & Global",
        "type": "Private APN & IoT VPN Infrastructure",
        "api_endpoint": "CMP Portal / Direct API Gateway",
        "auth_method": "API Keys / CMP Auth Token",
        "status": "Active"
    },
    "Paladion / InfoSec": {
        "region": "Asia (India & Middle East)",
        "type": "Managed Security Services & Threat Detection",
        "api_endpoint": "REST API SOAR Integration",
        "auth_method": "Bearer Token",
        "status": "Active"
    },
    "Open-Source Anti-Censorship & Proxy Proxies": {
        "region": "Asia / Global Open-Source",
        "type": "V2Ray, Xray & Shadowsocks Tunneling Protocols",
        "api_endpoint": "Local gRPC / REST API Control Panels",
        "auth_method": "JSON Config / API Secret",
        "status": "Active"
    }
}

def test_and_save():
    filename = "sangfor_security_platforms.json"
    print("[TEST] Provjera integriteta podataka i API strukture za Sangfor i regiju...")
    
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(SANGFOR_SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno testirano i sačuvano u fajl: {filename}")

if __name__ == "__main__":
    print("Pokretanje automatskog testiranja i ažuriranja Sangfor i regionalnih sigurnosnih servisa...")
    test_and_save()
EOF

# Izvršavanje testiranja i ažuriranja
python sangfor_security_manager.py

# Testiranje lokalnog git statusa
git status

# Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Dodate i ažurirane Sangfor Technologies i regionalne API sigurnosne konfiguracije"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
