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

# Kreiranje ili ažuriranje JSON fajla sa bezbednosnim podacima za Kinu, APN-ovima i VPN/proxy resursima
cat << 'EOF' > china_security_manager.json
{
  "timestamp": "2026-07-25T17:13:36Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "security_companies_china": [
    {
      "name": "Qihoo 360 (360 Security Technology)",
      "country": "Kina",
      "description": "Jedna od najvećih i najpoznatijih kineskih kompanija za internet i mobilnu bezbednost, poznata po naprednim mehanizmima za detekciju pretnji, antivirusnim rešenjima i analizi globalnih APT grupa.",
      "url": "https://www.360.net"
    },
    {
      "name": "Sangfor Technologies",
      "country": "Kina",
      "description": "Vodeći provajder rešenja za bezbednost preduzeća, cloud računarstvo, mrežnu infrastrukturu i vatrozide.",
      "url": "https://www.sangfor.com"
    },
    {
      "name": "Venustech",
      "country": "Kina",
      "description": "Pionir i lider u oblasti informacione bezbednosti u Kini, specijalizovan za mrežnu bezbednost, SIEM sisteme i bezbednosne operativne centre (SOC).",
      "url": "https://www.venustech.com.cn"
    },
    {
      "name": "NSFOCUS",
      "country": "Kina",
      "description": "Kompanija fokusirana na rešenja za zaštitu od DDoS napada, bezbednost web aplikacija i duboku inspekciju mrežnog saobraćaja za velike telekomunikacione i finansijske institucije.",
      "url": "https://nsfocusglobal.com"
    },
    {
      "name": "Ant Group / Tencent Security",
      "country": "Kina",
      "description": "Interni bezbednosni timovi tehnoloških giganta koji se bave zaštitom finansijskih transakcija, veštačke inteligencije i masivnih cloud platformi.",
      "url": "https://www.tencent.com"
    }
  ],
  "china_apn_settings": [
    {
      "carrier": "China Mobile",
      "apn": "cmnet",
      "alt_apn": "cmlap",
      "mmsc": "http://mmsc.monternet.com",
      "mms_proxy": "10.0.0.172",
      "mms_port": "80"
    },
    {
      "carrier": "China Unicom",
      "apn": "3gnet",
      "alt_apn": "uninet",
      "mmsc": "http://mmsc.myuni.com.cn",
      "mms_proxy": "10.0.0.172",
      "mms_port": "80"
    },
    {
      "carrier": "China Telecom",
      "apn": "ctnet",
      "alt_apn": "ctwap",
      "mmsc": "http://mms.mycdma.cn",
      "mms_proxy": "10.0.0.200",
      "mms_port": "80"
    }
  ],
  "vpn_proxy_tools_china": [
    {
      "name": "Shadowsocks / ShadowsocksR (SSR)",
      "description": "Protokoli razvijeni specifično za zaobilaženje mrežnog filtriranja i Great Firewall-a u Kini."
    },
    {
      "name": "V2Ray / Xray",
      "protocols": ["VLESS", "VMess", "XTLS/TLS maskiranje"],
      "description": "Napredni alati koji sakrivaju VPN saobraćaj tako da izgleda identično kao običan HTTPS web saobraćaj."
    },
    {
      "name": "Trojan",
      "description": "Protokol koji imitira standardni HTTPS protokol preko porta 443 radi izbegavanja detekcije."
    },
    {
      "name": "Specijalizovani komercijalni servisi",
      "description": "Stealth i Obfuscated serveri sa automatskom promenom portova za rad u Kini."
    }
  ]
}
EOF

# Git konfiguracija i sinhronizacija izmena
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add china_security_manager.json
git commit -m "Auto-sync: Dodata ažurirana kineska sigurnosna, APN i VPN/proxy konfiguracija"
git push origin japantokio
