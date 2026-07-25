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

# Kreiranje ili ažuriranje JSON fajla sa bezbednosnim podacima, APN-ovima i VPN resursima
cat << 'EOF' > usa_security_manager.json
{
  "timestamp": "2026-07-25T16:57:24Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "security_companies": [
    {
      "name": "Palo Alto Networks",
      "description": "Jedan od lidera u enterprise mrežnoj bezbednosti i cloud zaštiti.",
      "url": "https://www.paloaltonetworks.com"
    },
    {
      "name": "CrowdStrike",
      "description": "Specijalizovani za naprednu endpoint zaštitu (detekciju i sprečavanje pretnji na uređajima).",
      "url": "https://www.crowdstrike.com"
    },
    {
      "name": "Check Point Software Technologies",
      "description": "Pionir u oblasti sajber-bezbednosti i mrežnih vatrozida (firewall).",
      "url": "https://www.checkpoint.com"
    },
    {
      "name": "Cloudflare",
      "description": "Poznati po zaštiti web aplikacija, DDoS mitigaciji i Zero Trust mrežnim uslugama.",
      "url": "https://www.cloudflare.com"
    },
    {
      "name": "Fortinet",
      "description": "Kompanija poznata po visokoefikasnim mrežnim rešenjima i FortiGate uređajima za zaštitu infrastrukture.",
      "url": "https://www.fortinet.com"
    }
  ],
  "usa_apn_settings": [
    {
      "carrier": "T-Mobile",
      "apn": "fast.t-mobile.com",
      "mmsc": "http://mms.msg.eng.t-mobile.com/mms/wapenc",
      "mcc": "310",
      "mnc": "260"
    },
    {
      "carrier": "AT&T",
      "apn": "ENHANCEDPHONE",
      "alt_apn": "NXTGENPHONE",
      "mmsc": "http://mmsc.mobile.att.net",
      "mms_proxy": "proxy.mobile.att.net",
      "mms_port": "80",
      "mcc": "310",
      "mnc": "410"
    }
  ],
  "vpn_providers_usa": [
    {
      "name": "NordVPN",
      "url": "https://nordvpn.com"
    },
    {
      "name": "ExpressVPN",
      "url": "https://www.expressvpn.com"
    },
    {
      "name": "ProtonVPN",
      "url": "https://protonvpn.com"
    }
  ]
}
EOF

# Git konfiguracija i sinhimizacija izmena
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add usa_security_manager.json
git commit -m "Auto-sync: Dodata ažurirana USA sigurnosna, APN i VPN konfiguracija"
git push origin japantokio
