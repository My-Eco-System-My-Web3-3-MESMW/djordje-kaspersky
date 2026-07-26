#!/bin/bash

# ==========================================
# Glavna menadžerska skripta za repozitorijum
# Repozitorijum: djordje-kaspersky
# ==========================================

BRANCHES=("japantokio" "main" "dev" "staging")

# Funkcija za popravku i resetovanje Git stanja (bivši fix_git_sync.sh)
fix_git_state() {
    echo ""
    echo "==> [1/2] Proveravam Git status..."
    git status

    if [ $? -ne 0 ]; then
        echo "GRESKA: Ovo nije Git repozitorijum!"
        return 1
    fi

    echo "==> Prekidam aktivne procese spajanja/rebase-ovanja..."
    git merge --abort 2>/dev/null
    git rebase --abort 2>/dev/null

    echo "==> Osvežavam podatke sa udaljenog servera (fetch origin)..."
    git fetch origin --all --prune

    echo "==> Git okruženje je uspešno očišćeno i spremno za rad!"
}

# Funkcija za sinhronizaciju svih grana (bivši sync_all_branches.sh)
sync_branches() {
    echo ""
    echo "==> [2/2] Pokrećem sinhronizaciju za sve grane..."
    
    CURRENT_BRANCH=$(git symbolic-ref --short HEAD)
    echo "==> Trenutna grana: $CURRENT_BRANCH"

    git fetch origin --all

    for branch in "${BRANCHES[@]}"; do
        echo "--------------------------------------------------"
        echo "==> Obrađujem granu: $branch"
        
        git checkout "$branch" 2>/dev/null
        if [ $? -ne 0 ]; then
            echo "UPOZORENJE: Grana '$branch' ne postoji lokalno. Kreiram je..."
            git checkout -b "$branch" "origin/$branch"
            if [ $? -ne 0 ]; then
                echo "GRESKA: Ne mogu da pronađem granu '$branch' na origin-u. Preskačem."
                continue
            fi
        fi

        git pull origin "$branch"
        git push origin "$branch"
    done

    echo "--------------------------------------------------"
    echo "==> Vraćam se na početnu granu: $CURRENT_BRANCH"
    git checkout "$CURRENT_BRANCH"

    echo "==> Sinhronizacija svih grana je uspešno završena!"
}

# Glavni meni
clear
echo "=================================================="
echo "    REPOZITORIJUM MENADŽER: djordje-kaspersky"
echo "=================================================="
echo "1) Samo očisti i popravi Git stanje (fix_git_sync)"
echo "2) Samo sinhronizuj sve grane (sync_all_branches)"
echo "3) Uradi SVE (Prvo popravi stanje, pa sinhronizuj grane)"
echo "4) Izlaz"
echo "=================================================="
read -p "Izaberi opciju (1-4): " choice

case $choice in
    1)
        fix_git_state
        ;;
    2)
        sync_branches
        ;;
    3)
        fix_git_state
        sync_branches
        ;;
    4)
        echo "Izlaz iz skripte."
        exit 0
        ;;
    *)
        echo "GRESKA: Nepoznata opcija!"
        exit 1
        ;;
esac
