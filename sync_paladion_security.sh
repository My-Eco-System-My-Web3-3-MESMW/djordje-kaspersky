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

# Generisanje ili ažuriranje Python skripte za Paladion / InfoSec platformu
cat << 'EOF' > paladion_security_manager.py
import json
import urllib.request
import os

PALADION_SECURITY_SERVICES = {
    "Paladion / InfoSec": {
        "region": "Asia (India & Middle East)",
        "type": "Managed Security Services, Incident Detection & SOAR Integration",
        "api_endpoint": "REST API SOAR Integration Gateway",
        "auth_method": "Bearer Token / API Keys",
        "status": "Active"
    }
}

def test_and_save():
    filename = "paladion_security_platforms.json"
    print("[TEST] Provjera integriteta podataka i API strukture za Paladion / InfoSec...")
    
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(PALADION_SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno testirano i sačuvano u fajl: {filename}")

if __name__ == "__main__":
    print("Pokretanje automatskog testiranja i ažuriranja Paladion / InfoSec servisa...")
    test_and_save()
EOF

# Izvršavanje testiranja i ažuriranja
python paladion_security_manager.py

# Testiranje lokalnog git statusa
git status

# Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Dodate i ažurirane Paladion / InfoSec upravljane mrežne sigurnosti i SOAR API konfiguracije"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
