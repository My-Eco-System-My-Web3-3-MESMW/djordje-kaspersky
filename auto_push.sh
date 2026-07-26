#!/data/data/com.termux/files/usr/bin/bash

# Postavite putanju do Vašeg repozitorijuma
REPO_DIR="$HOME/djordje-kaspersky"

cd "$REPO_DIR" || { echo "[!] Direktorijum nije pronađen!"; exit 1; }

echo "[*] Provjera statusa git repozitorijuma..."
git status

# Provjera da li ima promjena za commitovanje
if [[ -n $(git status -s) ]]; then
    echo "[*] Detektovane promjene. Pokrećem automatsku sinkronizaciju..."
    
    git add .
    
    # Kreiranje automatske poruke sa trenutnim datumom i vremenom
    COMMIT_MSG="Auto-sync: Ažuriranje konfiguracija $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MSG"
    
    # Sinhronizacija sa udaljenim serverom (pull pa push da se spriječe konflikti)
    echo "[*] Preuzimanje najnovijih izmjena sa servera (git pull)..."
    git pull origin japantokio --rebase
    
    echo "[*] Slanje izmjena na GitHub (git push)..."
    git push origin japantokio
    
    if [ $? -eq 0 ]; then
        echo "[✔] Sinhronizacija i push uspješno završeni!"
    else
        echo "[✖] Greška prilikom slanja (push) na GitHub."
    fi
else
    echo "[i] Nema novih promjena za sinhronizaciju."
fi
