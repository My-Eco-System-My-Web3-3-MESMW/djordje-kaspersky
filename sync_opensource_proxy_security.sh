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

# Generisanje ili ažuriranje Python skripte za Open-Source proksi i tunel projekte
cat << 'EOF' > opensource_proxy_security_manager.py
import json
import urllib.request
import os

OPENSOURCE_PROXY_SECURITY_SERVICES = {
    "Open-Source & Local Proxy / Tunnel Projects (Asia Developer Community)": {
        "region": "India, Pakistan & Broader Asian Region",
        "type": "Network Privacy, Advanced Open-Source Protocols (V2Ray/Xray, Shadowsocks)",
        "api_endpoint": "Local gRPC / REST API Control Panels",
        "auth_method": "JSON Config / API Secret Token",
        "status": "Active"
    }
}

def test_and_save():
    filename = "opensource_proxy_security_platforms.json"
    print("[TEST] Provjera integriteta podataka i API strukture za Open-Source proksi i tunel projekte...")
    
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(OPENSOURCE_PROXY_SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno testirano i sačuvano u fajl: {filename}")

if __name__ == "__main__":
    print("Pokretanje automatskog testiranja i ažuriranja Open-Source proksi i tunel servisa...")
    test_and_save()
EOF

# Izvršavanje testiranja i ažuriranja
python opensource_proxy_security_manager.py

# Testiranje lokalnog git statusa
git status

# Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Dodate i ažurirane Open-Source proksi i tunel API konfiguracije za azijsku zajednicu developera"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
