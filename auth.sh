#!/data/data/com.termux/files/usr/bin/bash

echo "=== Pokretanje napredne auth.sh skripte za sinhronizaciju i autorizaciju ==="

# 1. Postavljanje identiteta za Git
git config --global user.name "djordjeglavonjic25"
git config --global user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

# 2. Ažuriranje paketa i instalacija neophodnih alata
pkg update && pkg upgrade -y
pkg install git python curl nano -y

# 3. Navigacija ili kloniranje repozitorijuma djordje-kaspersky na grani japantokio
if [ -d "$HOME/djordje-kaspersky" ]; then
    cd "$HOME/djordje-kaspersky"
    git checkout japantokio || git checkout -b japantokio
    git pull origin japantokio
else
    cd "$HOME"
    git clone https://github.com/djordjeglavonjic25/djordje-kaspersky.git
    cd "$HOME/djordje-kaspersky"
    git checkout japantokio || git checkout -b japantokio
fi

# 4. Kreiranje foldera za autorizacione konfiguracije
mkdir -p auth_configs
cd auth_configs

# 5. Generisanje master JSON fajla sa svim mrežnim, IP i naložnim parametrima
cat << 'EOF' > security_auth_master.json
{
  "timestamp": "2026-07-25T18:44:53Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "device_private_ip": "10.0.0.1",
  "public_identities_and_projects": {
    "emails": [
      "djordje.gl.sa@gmail.com",
      "djgl2014gldj@gmail.com",
      "djordjeglavonjic25@yandex.ru"
    ],
    "google_cloud_project": {
      "project_number": "460218354140",
      "project_id": "polar-valor-491009-s1"
    },
    "yandex_auth_ip": {
      "ip": "46.239.2.70",
      "location": "Banja Luka"
    },
    "primary_public_ip_australia": {
      "ip": "172.94.103.135",
      "city": "Brisbane",
      "region": "Queensland",
      "country": "Australia",
      "postal_code": "4000",
      "timezone": "UTC +10:00",
      "isp": "Secure Internet LLC",
      "asn": "132372"
    }
  }
}
EOF

# 6. Kreiranje Python menadžera za automatsku validaciju
cat << 'EOF' > auth_manager.py
import json
import os

def verify_and_save():
    print("[TEST] Provjera autentifikacije i mrežnih sesija za Git, APN i VPN podatke...")
    with open("security_auth_master.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    print(f"[INFO] Uspješno učitani parametri za repozitorijum: {data['repository']}")
    print(f"[INFO] Privatna IP: {data['device_private_ip']} | Javna IP (Brisbane): {data['public_identities_and_projects']['primary_public_ip_australia']['ip']}")

if __name__ == "__main__":
    verify_and_save()
EOF

# Izvršavanje Python validacije
python auth_manager.py

# Vraćanje u koren repozitorijuma radi git sinhronizacije
cd "$HOME/djordje-kaspersky"

# 7. Slanje ažuriranih promjena na GitHub
git add .
git commit -m "Auto-sync: Ažurirana kompletna auth.sh skripta sa svim IP adresama, projektima i autorizacijom"
git push origin japantokio

echo "[INFO] Proces autentifikacije, generisanja i sinhronizacije je uspješno završen."
