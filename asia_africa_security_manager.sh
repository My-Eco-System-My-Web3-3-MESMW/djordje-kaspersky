cd ~
# Provera da li postoji direktorijum i pozicioniranje na odgovarajuću granu
if [ -d "djordje-kaspersky" ]; then
    cd djordje-kaspersky
    git checkout japantokio || git checkout -b japantokio
else
    git clone https://github.com/djordjeglavonjic25/djordje-kaspersky.git
    cd djordje-kaspersky
    git checkout japantokio || git checkout -b japantokio
fi

# Kreiranje ili ažuriranje JSON fajla sa podacima za Aziju i Afriku
cat << 'EOF' > asia_africa_security_manager.json
{
  "timestamp": "2026-07-25T17:25:35Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "asia": {
    "security_companies": [
      {
        "name": "Trend Micro",
        "headquarters": "Japan / Tajvan",
        "description": "Globalni lider u bezbednosti klauda, zaštiti servera i enterprise endpoint rešenjima.",
        "url": "https://www.trendmicro.com"
      },
      {
        "name": "Quick Heal Technologies",
        "headquarters": "Indija",
        "description": "Vodeći indijski provajder rešenja za bezbednost krajnjih uređaja i mobilnih platformi.",
        "url": "https://www.quickheal.co.in"
      },
      {
        "name": "AhnLab",
        "headquarters": "Južna Koreja",
        "description": "Pionir u mrežnoj i endpoint bezbednosti, antivirusnim rešenjima i detekciji pretnji u Južnoj Koreji.",
        "url": "https://global.ahnlab.com"
      }
    ],
    "apn_settings": [
      {
        "country": "Japan",
        "carrier": "NTT Docomo",
        "name": "Docomo LTE",
        "apn": "sp-mode.ne.jp"
      },
      {
        "country": "Indija",
        "carrier": "Jio",
        "name": "JioNet",
        "apn": "jionet"
      },
      {
        "country": "Južna Koreja",
        "carrier": "SK Telecom",
        "name": "SKT LTE",
        "apn": "lte.sktelecom.com"
      }
    ],
    "vpn_notes": {
      "japan_south_korea": "Potpuno otvorena internet infrastruktura; komercijalni VPN servisi rade bez ikakvih smetnji, sa brzim serverima u Seulu i Tokiju.",
      "india": "Strogi zakoni o čuvanju podataka (logging laws); mnoge kompanije koriste virtuelne servere sa lokalnim IP adresama."
    }
  },
  "africa": {
    "security_companies": [
      {
        "name": "CipherWave / Liquid Intelligent Technologies",
        "headquarters": "Južna Afrika / Regionalno prisustvo",
        "description": "Obezbeđuju robusnu mrežnu infrastrukturu, cloud bezbednost i enterprise zaštitu širom afričkog kontinenta.",
        "url": "https://www.liquid.tech"
      },
      {
        "name": "ESET Southern Africa",
        "headquarters": "Južna Afrika",
        "description": "Regionalni ogranak globalnog lidera sa fokusom na enterprise i kućnu bezbednost u podsaharskoj Africi.",
        "url": "https://www.eset.com"
      }
    ],
    "apn_settings": [
      {
        "country": "Južna Afrika",
        "carrier": "Vodacom",
        "name": "Vodacom",
        "apn": "internet"
      },
      {
        "country": "Egipat",
        "carrier": "Vodafone Egypt",
        "name": "Vodafone EG",
        "apn": "internet.vodafone.com.eg"
      },
      {
        "country": "Kenija",
        "carrier": "Safaricom",
        "name": "Safaricom",
        "apn": "safaricom"
      }
    ],
    "vpn_notes": {
      "south_africa": "Stabilno i slobodno regulatorno okruženje; serveri u Johanezburgu obezbeđuju nisku latenciju.",
      "north_east_africa": "Državne institucije primenjuju stroga ograničenja i blokade na VPN protokole (poput OpenVPN/PPTP), pa se koriste protokoli sa naprednom obfuskacijom."
    }
  }
}
EOF

# Git konfiguracija i sinhronizacija izmena
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add asia_africa_security_manager.json
git commit -m "Auto-sync: Dodata ažurirana azijska i afrička sigurnosna, APN i VPN konfiguracija"
git push origin japantokio
