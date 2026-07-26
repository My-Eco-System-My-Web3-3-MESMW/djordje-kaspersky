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

# Generisanje Python skripte za integraciju sigurnosnih API-ja (OpenVPN, Tailscale, NetBird, Pritunl, Cloudflare)
cat << 'EOF' > api_security_manager.py
import json
import urllib.request

# Konfiguracioni parametri bazirani na servisima otvorenog koda i API ključevima
SECURITY_SERVICES = {
    "OpenVPN": {
        "type": "Site-to-Site / Access Server",
        "api_endpoint": "https://api.openvpn.com/v1/",
        "auth_method": "API Key / Token"
    },
    "Tailscale": {
        "type": "Mesh VPN / Zero Trust",
        "api_endpoint": "https://api.tailscale.com/api/v2/",
        "auth_method": "OAuth / API Access Token"
    },
    "NetBird": {
        "type": "Open-source Zero Trust Network",
        "api_endpoint": "https://api.netbird.io/api/",
        "auth_method": "Personal Access Token"
    },
    "Pritunl": {
        "type": "Open-source Enterprise VPN",
        "api_endpoint": "https://your-pritunl-server/órders",
        "auth_method": "API Secret & Token"
    },
    "Cloudflare": {
        "type": "Cloud Edge SASE / Zero Trust",
        "api_endpoint": "https://api.cloudflare.com/client/v4/",
        "auth_method": "Bearer Token"
    }
}

def save_config():
    filename = "us_security_platforms.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno sačuvane konfiguracije sigurnosnih servisa u fajl: {filename}")

if __name__ == "__main__":
    print("Inicijalizacija menadžera sigurnosnih API integracija...")
    save_config()
EOF

# Izvršavanje skripte
python api_security_manager.py

# Slanje promjena na GitHub
git add .
git commit -m "Dodate sigurnosne API konfiguracije za SAD platforme (OpenVPN, Tailscale, NetBird, Pritunl, Cloudflare)"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
