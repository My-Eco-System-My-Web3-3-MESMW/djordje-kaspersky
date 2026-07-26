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

# Kreiranje ili ažuriranje JSON fajla sa bezbednosnim podacima za Rusiju, APN-ovima i VPN resursima
cat << 'EOF' > russia_security_manager.json
{
  "timestamp": "2026-07-25T17:07:42Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "security_companies_russia": [
    {
      "name": "Kaspersky",
      "country": "Rusija",
      "description": "Globalno prepoznatljiva kompanija sa sedištem u Moskvi, specijalizovana za zaštitu krajnjih uređaja (endpoint security), antivirusna rešenja i naprednu detekciju pretnji.",
      "url": "https://www.kaspersky.com"
    },
    {
      "name": "Positive Technologies",
      "country": "Rusija",
      "description": "Jedna od vodećih ruskih kompanija za sajber-bezbednost, fokusirana na sisteme za upravljanje ranjivostima, vatrozide za web aplikacije (WAF) i SIEM rešenja (MaxPatrol).",
      "url": "https://global.ptsecurity.com"
    },
    {
      "name": "InfoWatch",
      "country": "Rusija",
      "description": "Kompanija specijalizovana za sisteme za sprečavanje curenja podataka (DLP) i upravljanje internom korporativnom bezbednošću.",
      "url": "https://www.infowatch.ru"
    },
    {
      "name": "Security Code (Код Безопасности)",
      "country": "Rusija",
      "description": "Kompanija fokusirana na razvoj sredstava za zaštitu informacija, enkripciju podataka i bezbednost mrežne infrastrukture.",
      "url": "https://www.securitycode.ru"
    },
    {
      "name": "Solar (Rostelecom-Solar)",
      "country": "Rusija",
      "description": "Nacionalni provajder usluga i tehnologija za sajber-bezbednost, poznat po operativnim SOC centrima i zaštiti velikih korporativnih i državnih sistema.",
      "url": "https://rt-solar.ru"
    }
  ],
  "russia_apn_settings": [
    {
      "carrier": "MTS (Mobile TeleSystems)",
      "apn": "internet.mts.ru",
      "mmsc": "http://mmsc.msk.mts.ru",
      "mms_proxy": "192.168.192.21",
      "mms_port": "8080"
    },
    {
      "carrier": "Megafon",
      "apn": "internet",
      "mmsc": "http://mmsc.megafon.ru",
      "mms_proxy": "10.10.10.10",
      "mms_port": "8080"
    },
    {
      "carrier": "Beeline",
      "apn": "internet.beeline.ru",
      "mmsc": "http://mms/",
      "mms_proxy": "192.168.200.1",
      "mms_port": "8080"
    }
  ],
  "vpn_providers_russia": [
    {
      "name": "Kaspersky VPN Secure Connection",
      "description": "Integrisano rešenje sa globalnim i lokalnim čvorovima."
    },
    {
      "name": "Komercijalni i open-source provajderi",
      "description": "Podrška za napredne i maskirane protokole (V2Ray, Shadowsocks, obfuskirani tuneli)."
    }
  ]
}
EOF

# Git konfiguracija i sinhronizacija izmena
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add russia_security_manager.json
git commit -m "Auto-sync: Dodata ažurirana ruska sigurnosna, APN i VPN konfiguracija"
git push origin japantokio
