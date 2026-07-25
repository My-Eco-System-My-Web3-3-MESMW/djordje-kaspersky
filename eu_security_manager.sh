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

# Kreiranje ili ažuriranje JSON fajla sa bezbednosnim podacima za EU, APN-ovima i VPN resursima
cat << 'EOF' > eu_security_manager.json
{
  "timestamp": "2026-07-25T17:03:35Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "security_companies_eu": [
    {
      "name": "ESET",
      "country": "Slovačka",
      "description": "Jedan od globalnih lidera u zaštiti krajnjih uređaja (endpoint security) i detekciji pretnji.",
      "url": "https://www.eset.com"
    },
    {
      "name": "Avast (Gen Digital)",
      "country": "Češka",
      "description": "Prepoznatljiva po rešenjima za ličnu i mrežnu bezbednost.",
      "url": "https://www.avast.com"
    },
    {
      "name": "Atos / Eviden",
      "country": "Francuska",
      "description": "Specijalizovana za digitalnu bezbednost, cloud rešenja i upravljanje mrežama.",
      "url": "https://eviden.com"
    },
    {
      "name": "Nokia Security",
      "country": "Finska",
      "description": "Poznata po naprednim mrežnim rešenjima i bezbednosti telekomunikacione infrastrukture.",
      "url": "https://www.nokia.com"
    },
    {
      "name": "Securitas Direct",
      "country": "Švedska",
      "description": "Bavi se fizičkim i integrisanim elektronskim bezbednosnim sistemima.",
      "url": "https://www.securitasdirect.com"
    }
  ],
  "eu_apn_settings": [
    {
      "country": "Nemačka",
      "carrier": "Deutsche Telekom",
      "apn": "internet.t-d1.de",
      "mmsc": "http://mms.telekom.de/mms/wapenc",
      "mms_proxy": "149.242.24.3",
      "mms_port": "80"
    },
    {
      "country": "Nemačka",
      "carrier": "Vodafone Germany",
      "apn": "web.vodafone.de"
    },
    {
      "country": "Francuska",
      "carrier": "Orange France",
      "apn": "orange",
      "mmsc": "http://mms.orange.fr",
      "mms_proxy": "192.168.10.200",
      "mms_port": "8080"
    },
    {
      "country": "Francuska",
      "carrier": "SFR",
      "apn": "sl2sfr"
    }
  ],
  "vpn_providers_eu": [
    {
      "name": "NordVPN",
      "url": "https://nordvpn.com"
    },
    {
      "name": "ProtonVPN",
      "country": "Švajcarska",
      "description": "Visoki standardi privatnosti",
      "url": "https://protonvpn.com"
    },
    {
      "name": "Mullvad VPN",
      "country": "Švedska",
      "description": "Fokusiran na maksimalnu anonimnost",
      "url": "https://mullvad.net"
    }
  ]
}
EOF

# Git konfiguracija i sinhronizacija izmena
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add eu_security_manager.json
git commit -m "Auto-sync: Dodata ažurirana EU sigurnosna, APN i VPN konfiguracija"
git push origin japantokio

