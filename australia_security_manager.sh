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

# Kreiranje ili ažuriranje JSON fajla sa podacima za Australiju
cat << 'EOF' > australia_security_manager.json
{
  "timestamp": "2026-07-25T17:29:48Z",
  "repository": "djordje-kaspersky",
  "branch": "japantokio",
  "australia": {
    "security_companies": [
      {
        "name": "CyberCX",
        "description": "Jedna od vodećih australijskih kompanija za pružanje sveobuhvatnih usluga sajber-bezbednosti, upravljanih bezbednosnih operativnih centara (SOC) i forenzike.",
        "url": "https://cybercx.com.au"
      },
      {
        "name": "Senetas",
        "description": "Specijalizovani australijski proizvođač visoko-performantnih rešenja za šifrovanje podataka u pokretu (Encryption in Transit) za vladine, vojne i enterprise mreže.",
        "url": "https://www.senetas.com"
      },
      {
        "name": "Tesserent (deo Thales grupe)",
        "description": "Istaknuti australijski provajder enterprise mrežne bezbednosti, cloud zaštite i usluga detekcije pretnji.",
        "url": "https://www.tesserent.com"
      },
      {
        "name": "Atlassian (Security Division)",
        "description": "Tehnološki gigant sa sedištem u Sidneju sa naprednim bezbednosnim timovima i standardima za zaštitu podataka u klaudu.",
        "url": "https://www.atlassian.com"
      }
    ],
    "apn_settings": [
      {
        "carrier": "Telstra",
        "name": "Telstra Internet",
        "apn": "telstra.internet",
        "username": "",
        "password": ""
      },
      {
        "carrier": "Optus",
        "name": "Optus Internet",
        "apn": "internet",
        "mmsc": "http://mmsc.optus.com.au:8002",
        "mms_proxy": "61.88.190.10",
        "mms_port": "80"
      },
      {
        "carrier": "Vodafone Australia",
        "name": "Vodafone",
        "apn": "live.vodafone.com",
        "mmsc": "http://pki.vodafone.net.au/to/mms",
        "mms_proxy": "10.202.2.60",
        "mms_port": "80"
      }
    ],
    "vpn_and_regulatory_environment": {
      "regulatory_notes": "Stabilna i otvorena internet infrastruktura sa strogim zakonima o zadržavanju podataka (Telecommunications and Other Legislation Amendment (Assistance and Access) Act).",
      "commercial_vpn": ["NordVPN", "ExpressVPN", "ProtonVPN"],
      "corporate_vpn": "IPsec VPN tuneli i SASE arhitekture sa lokalnim data centrima."
    }
  }
}
EOF

# Git konfiguracija i sinhronizacija izmena
git config user.name "djordjeglavonjic25"
git config user.email "236400041+djordjeglavonjic25@users.noreply.github.com"

git add australia_security_manager.json
git commit -m "Auto-sync: Dodata ažurirana australijska sigurnosna, APN i VPN konfiguracija"
git push origin japantokio
