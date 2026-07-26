#!/bin/bash

echo "=== [1/4] Provera Git direktorijuma ==="
if [ ! -d ".git" ]; then
    echo "Greška: Ovo nije Git direktorijum!"
    exit 1
fi

echo "=== [2/4] Preuzimanje svih grana sa servera ==="
git fetch origin --prune

echo "=== [3/4] Petlja za sinhronizaciju svake grane ==="
# Pronalazi sve udaljene grane i uklanja prefiks 'origin/'
for remote_branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
    remote_branch=$(echo "$remote_branch" | tr -d ' ')
    echo "--- Obrađujem granu: $remote_branch ---"
    
    # Prebaci se na granu ili je kreiraj ako ne postoji lokalno
    if git show-ref --verify --quiet refs/heads/$remote_branch; then
        git checkout "$remote_branch"
    else
        git checkout -b "$remote_branch" "origin/$remote_branch"
    fi
    
    # Povuci najnovije izmene i pošalji nazad
    git pull origin "$remote_branch" --no-edit || echo "Nema automatskog spajanja za $remote_branch"
    git push origin "$remote_branch" --force
done

echo "=== [4/4] Vraćanje na glavnu granu i čišćenje ==="
git checkout dzen 2>/dev/null || git checkout main 2>/dev/null

echo "=== SVE GRANE SU USPEŠNO AŽURIRANE I SINHRONIZOVANE! ==="
