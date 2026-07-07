#!/bin/bash
# Automatska Kaspersky sinhronizacija
git add .
git commit -m "Kaspersky automatsko azuriranje: $(date)"
git push origin Dzen
echo "Projekat je uspjesno sinhronizovan sa GitHubom!"
