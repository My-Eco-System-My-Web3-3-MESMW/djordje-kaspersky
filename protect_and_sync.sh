#!/data/data/com.termux/files/usr/bin/bash

echo "=== Pokretanje napredne zaštite i sinhronizacije za Samsung Galaxy A32 ==="

# 1. Definisanje Git identiteta
git config --global user.name "djordjeglavonjic25"
git config --global user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

# 2. Provera grane
git checkout japantokio || git checkout -b japantokio

# 3. Kreiranje lokalnog .gitignore fajla da osetljive skripte i killswitch nikada ne idu javno na GitHub
cat << 'EOF' > .gitignore
# Osetljivi bezbednosni i killswitch fajlovi (drže se lokalno na 10.0.0.1)
remote_killswitch_sync.sh
security_auth_master.json
auth_configs/
security_configs/
*.key
*.pem
EOF

echo "[INFO] Kreiran .gitignore za zaštitu osetljivih podataka uređaja."

# 4. Automatsko prepoznavanje i lokalno zaključavanje osetljivih fajlova
if [ -f "remote_killswitch_sync.sh" ]; then
    chmod 600 remote_killswitch_sync.sh
    echo "[INFO] Fajl remote_killswitch_sync.sh je lokalno obezbeđen (privatan režim)."
fi

if [ -f "security_auth_master.json" ]; then
    chmod 600 security_auth_master.json
    echo "[INFO] Fajl security_auth_master.json je lokalno obezbeđen."
fi

# 5. Sinhronizacija preostalih (ne-osetljivih) fajlova sa GitHub-om
git add .
git commit -m "Auto-sync & Security: Sakriveni osetljivi podaci preko .gitignore i zaključane dozvole"
git push origin japantokio

echo "[INFO] Sinhronizacija završena. Osetljive komande i killswitch su izuzeti iz javnog prikaza."
