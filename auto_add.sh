#!/bin/bash
# Automatsko dodavanje SVIH novih fajlova u Kaspersky projekat

# Dodaje apsolutno sve fajlove u folderu
git add .

# Provjerava da li ima promjena
if [ -n "$(git status --porcelain)" ]; then
    git commit -m "Kaspersky auto-update: $(date)"
    git push origin Dzen
    echo "Sve promjene su uspješno dodate i sinhronizovane!"
else
    echo "Nema novih promjena za dodavanje."
fi
