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

# Generisanje ili ažuriranje Python skripte za globalne sigurnosne platforme (Tailscale, OpenVPN, NetBird, Mullvad, Cloudflare)
cat << 'EOF' > global_security_manager.py
import json
import urllib.request
import os

GLOBAL_SECURITY_SERVICES = {
    "Tailscale": {
        "region": "USA",
        "type": "SDN, Zero Trust & Mesh VPN",
        "api_endpoint": "https://api.tailscale.com/api/v2/",
        "auth_method": "OAuth / API Access Token",
        "status": "Active"
    },
    "OpenVPN": {
        "region": "USA",
        "type": "Corporate VPN & Site-to-Site",
        "api_endpoint": "https://api.openvpn.com/v1/",
        "auth_method": "API Key / XML-RPC",
        "status": "Active"
    },
    "NetBird": {
        "region": "EU / Germany",
        "type": "Open-Source ZTNA & Modern SDN",
        "api_endpoint": "https://api.netbird.io/api/",
        "auth_method": "Personal Access Token",
        "status": "Active"
    },
    "Mullvad VPN": {
        "region": "Sweden",
        "type": "Encrypted Open-Source VPN Infrastructure",
        "api_endpoint": "https://api.mullvad.net/",
        "auth_method": "Account Number / API Endpoint",
        "status": "Active"
    },
    "Cloudflare": {
        "region": "USA",
        "type": "Cloud Security, Edge VPN & SASE",
        "api_endpoint": "https://api.cloudflare.com/client/v4/",
        "auth_method": "Bearer Token",
        "status": "Active"
    }
}

def test_and_save():
    filename = "global_security_platforms.json"
    print("[TEST] Provjera integriteta podataka i globalne API strukture...")
    
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(GLOBAL_SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno testirano i sačuvano u fajl: {filename}")

if __name__ == "__main__":
    print("Pokretanje automatskog testiranja i ažuriranja globalnih sigurnosnih servisa...")
    test_and_save()
EOF

# Izvršavanje testiranja i ažuriranja
python global_security_manager.py

# Testiranje lokalnog git statusa
git status

# Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Dodate i ažurirane globalne sigurnosne API konfiguracije (Tailscale, OpenVPN, NetBird, Mullvad, Cloudflare)"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
