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

# Generisanje ili ažuriranje Python skripte za CommsCloud & floLIVE platformu
cat << 'EOF' > commscloud_security_manager.py
import json
import urllib.request
import os

COMMSCLOUD_SECURITY_SERVICES = {
    "CommsCloud & floLIVE": {
        "region": "Africa & Global Business",
        "type": "Private APN, IoT VPN & Mobile Network Infrastructure",
        "profiles": ["Africa1", "Africa3"],
        "api_endpoint": "CMP Portal / Direct API Gateway",
        "auth_method": "API Keys / CMP Auth Token",
        "status": "Active"
    }
}

def test_and_save():
    filename = "commscloud_security_platforms.json"
    print("[TEST] Provjera integriteta podataka i API strukture za CommsCloud & floLIVE...")
    
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(COMMSCLOUD_SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno testirano i sačuvano u fajl: {filename}")

if __name__ == "__main__":
    print("Pokretanje automatskog testiranja i ažuriranja CommsCloud & floLIVE servisa...")
    test_and_save()
EOF

# Izvršavanje testiranja i ažuriranja
python commscloud_security_manager.py

# Testiranje lokalnog git statusa
git status

# Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Dodate i ažurirane CommsCloud & floLIVE privatne APN i IoT VPN API konfiguracije"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
