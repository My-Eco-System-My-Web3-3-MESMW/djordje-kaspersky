#!/bin/bash

# Prelazak u radni direktorijum
cd ~/djordje-kaspersky || exit

echo "--- 1. Pokretanje svih Python skripti ---"
python api_security_check.py
python western_security_check.py
python russia_security_check.py
python china_security_check.py
python australia_security_check.py

echo "--- 2. Dodavanje svih izmjena u Git ---"
git add .

echo "--- 3. Kreiranje commita ---"
git commit -m "Automatska sinhronizacija i ažuriranje svih sigurnosnih skripti i JSON modela"

echo "--- 4. Slanje na GitHub (JapanTokio grana) ---"
git push -u origin JapanTokio

echo "--- SVE OPERACIJE SU USPJEŠNO ZAVRŠENE! ---"
