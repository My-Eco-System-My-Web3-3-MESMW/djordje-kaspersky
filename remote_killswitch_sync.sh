#!/data/data/com.termux/files/usr/bin/bash

echo "=== Pokretanje bezbednosnog sistema za prepoznavanje uređaja i zaštitu podataka ==="

# 1. Postavljanje Git identiteta
git config --global user.name "djordjeglavonjic25"
git config --global user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

# 2. Navigacija ili kloniranje repozitorijuma djordje-kaspersky na grani japantokio
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

# 3. Kreiranje foldera za naprednu bezbednost
mkdir -p security_configs
cd security_configs

# 4. Generisanje master fajla sa hardverskim i naložnim parametrima uređaja
cat << 'EOF' > device_killswitch_policy.json
{
  "device_info": {
    "device_name": "Samsung Galaxy A32",
    "model": "SM-A325F/DS",
    "serial_number": "RF8RB0Z6LZY",
    "imei_slot_1": "353100566808243",
    "imei_slot_2": "356059346808245",
    "private_ip": "10.0.0.1"
  },
  "authorized_identities": {
    "google_accounts": [
      "djordje.gl.sa@gmail.com",
      "djgl2014gldj@gmail.com"
    ],
    "yandex_account": "djordjeglavonjic25@yandex.ru",
    "github_user": "djordjeglavonjic25"
  },
  "security_protocol": {
    "status": "ARMED",
    "action_on_unauthorized_device": "TRIGGER_FACTORY_RESET",
    "description": "Ukoliko se detektuje neautorizovani uređaj ili promena hardverskog potpisa van definisanih IP i naložnih parametara, pokreće se automatsko brisanje podataka i vraćanje na fabrička podešavanja."
  }
}
EOF

# 5. Kreiranje Python skripte koja vrši proveru i simulira killswitch protokol
cat << 'EOF' > killswitch_validator.py
import json
import os

def check_security_status():
    print("[SECURITY] Učitavanje bezbednosne politike za Samsung Galaxy A32...")
    if not os.path.exists("device_killswitch_policy.json"):
        print("[GREŠKA] Nema bezbednosne politike!")
        return

    with open("device_killswitch_policy.json", "r", encoding="utf-8") as f:
        policy = json.loadf if hasattr(json, 'loadf') else json.load(f)

    dev = policy["device_info"]
    print(f"[INFO] Praćen uređaj: {dev['device_name']} ({dev['model']})")
    print(f"[INFO] Serijski broj: {dev['serial_number']} | IP: {dev['private_ip']}")
    print(f"[INFO] Sinhronizovani nalozi: {len(policy['authorized_identities']['google_accounts'])} Google + 1 Yandex.")
    print("[STATUS] Killswitch protokol je aktivan i sinhronizovan sa repozitorijumom.")

if __name__ == "__main__":
    check_security_status()
EOF

# Izvršavanje validacije
python killswitch_validator.py

# Povratak u koren repozitorijuma radi git sinhronizacije
cd "$HOME/djordje-kaspersky"

# 6. Slanje izmena na GitHub
git add .
git commit -m "Auto-sync: Dodat killswitch i hardverska politika za Samsung Galaxy A32"
git push origin japantokio

echo "[INFO] Skripta za zaštitu uređaja i sinhronizaciju je uspješno izvršena."
