import json
import os

def generate_regional_configs():
    print("[*] Generisanje regionalnih sigurnosnih postavki...")
    
    config_data = {
        "usa_eu": {
            "focus": "Standardna sloboda protoka i Mesh VPN integracija",
            "recommended_tools": ["NetBird", "Pritunl"],
            "api_endpoint_template": "",
            "cloud_providers": ["AWS", "DigitalOcean", "Hetzner"]
        },
        "asia_china_iran": {
            "focus": "Zaobilaženje DPI cenzure i obfuskacija saobraćaja",
            "recommended_tools": ["Amnezia VPN"],
            "protocols": ["XRay/VLESS", "Cloak", "Amnezia WireGuard"],
            "api_endpoint_template": ""
        },
        "russia": {
            "focus": "Otpornost na Roskomnadzor blokade",
            "recommended_tools": ["3X-UI panel"],
            "protocols": ["XTLS-Reality", "Shadowsocks"],
            "api_endpoint_template": ""
        }
    }
    
    file_path = "regional_nodes.json"
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(config_data, f, indent=4)
        
    print(f"[+] Uspješno kreiran fajl: {file_path}")

if __name__ == "__main__":
    generate_regional_configs()
