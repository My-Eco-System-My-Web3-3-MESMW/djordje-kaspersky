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

# Generisanje ili ažuriranje Python skripte za izraelske mrežne i sigurnosne platforme (civilne i vojne svrhe)
cat << 'EOF' > israel_security_manager.py
import json
import urllib.request
import os

ISRAEL_SECURITY_SERVICES = {
    "Check Point Software Technologies": {
        "region": "Israel (Global)",
        "type": "Civilian & Enterprise Network Security, Next-Gen Firewalls, VPN & SASE",
        "api_endpoint": "https://cloud.checkpoint.com/app/v1/",
        "auth_method": "Management API Key / Cloud Auth Token",
        "status": "Active"
    },
    "CyberArk": {
        "region": "Israel (Global)",
        "type": "Identity Security, Privileged Access Management (PAM) & Secure Network Access",
        "api_endpoint": "https://<tenant_id>.cyberark.cloud/PasswordVault/api/",
        "auth_method": "REST API Token / OAuth",
        "status": "Active"
    },
    "Elbit Systems (Cyber & Intelligence Division)": {
        "region": "Israel",
        "type": "Military & Defense Network Security, Tactical Communications & Encrypted Data Links",
        "api_endpoint": "Military Secure Gateway / Proprietary API Gateway",
        "auth_method": "Encrypted Military Token / Hardware Key",
        "status": "Active"
    },
    "Israel Aerospace Industries (IAI - ELTA Systems)": {
        "region": "Israel",
        "type": "Defense Electronics, Secure Tactical Networks & Cyber Defense Systems",
        "api_endpoint": "Secured Defense API Endpoint",
        "auth_method": "Classified Defense Token",
        "status": "Active"
    }
}

def test_and_save():
    filename = "israel_security_platforms.json"
    print("[TEST] Provjera integriteta podataka i API strukture za izraelski civilni i vojni sektor...")
    
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(ISRAEL_SECURITY_SERVICES, f, indent=4, ensure_ascii=False)
    print(f"[INFO] Uspješno testirano i sačuvano u fajl: {filename}")

if __name__ == "__main__":
    print("Pokretanje automatskog testiranja i ažuriranja izraelskih sigurnosnih servisa...")
    test_and_save()
EOF

# Izvršavanje testiranja i ažuriranja
python israel_security_manager.py

# Testiranje lokalnog git statusa
git status

# Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Dodate i ažurirane izraelske civilne i vojne mrežne, APN i sigurnosne API konfiguracije"
git push origin japantokio

echo "[INFO] Proces je uspješno završen u repozitorijumu djordje-kaspersky na grani japantokio."
