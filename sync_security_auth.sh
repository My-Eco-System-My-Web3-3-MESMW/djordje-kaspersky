#!/bin/bash

echo "=== Pokrećem sync_security_auth.sh kišobran skriptu ==="

# 1. Provera i pozicioniranje na repozitorijum i željenu granu
echo "[1/4] Provera lokalnog repozitorijuma i grane..."
cd ~
if [ -d "djordje-kaspersky" ]; then
    cd djordje-kaspersky
    git checkout japantokio || git checkout -b japantokio
else
    git clone https://github.com/djordjeglavonjic25/djordje-kaspersky.git
    cd djordje-kaspersky
    git checkout japantokio || git checkout -b japantokio
fi

# 2. Kreiranje master JSON fajla sa svim autorizacionim i mrežnim parametrima
echo "[2/4] Generisanje security_auth_master.json fajla..."
cat << 'EOF' > security_auth_master.json
{
  "timestamp": "2026-07-25T18:36:38Z",
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

# 3. Kreiranje izvršne bash autorizacione skripte
echo "[3/4] Kreiranje verifikacione skripte auth_verify.sh..."
cat << 'EOF' > auth_verify.sh
#!/bin/bash
echo "=== Pokretanje autorizacione provere za repozitorijum djordje-kaspersky ==="
echo "[INFO] Privatna IP adresa uredjaja: 10.0.0.1"
echo "[INFO] Aktivna javna IP adresa (Brisbane, Australia): 172.94.103.135"
echo "[INFO] Yandex bezbednosna IP adresa: 46.239.2.70"
echo "[INFO] Google Cloud Projekat ID: polar-valor-491009-s1 (Br. 460218354140)"
echo "Autorizacija uspešno učitana iz master JSON konfiguracije."
EOF

# Dodela dozvola za izvršavanje
chmod +x auth_verify.sh

# 4. Git konfiguracija i automatski push izmena na GitHub
echo "[4/4] Sinhronizacija sa GitHub-om..."
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add security_auth_master.json auth_verify.sh
git commit -m "Auto-sync: Dodata objedinjena autorizaciona skripta (sync_security_auth) i master JSON sa IP adresama i projektima"
git push origin japantokio

echo "=== Kišobran skripta je uspešno završila proces! ==="
