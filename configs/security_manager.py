import json
import os

CONFIG_DIR = os.path.dirname(os.path.abspath(__file__))

def init_env():
    print("[*] Inicijalizacija sigurnosnog APN/VPN modula za djordje-kaspersky...")
    # Osnovni šablon za skladištenje API ključeva po regijama (SAD, EU, Azija, Rusija, Kina, Iran, Afrika, Australija)
    regions_template = {
        "USA_EU": {"netbird_api": "", "headscale_api": ""},
        "ASIA_ME": {"amnezia_config": "", "iran_proxy": ""},
        "RU": {"xtls_reality": ""},
        "AFRICA_AUS": {"local_gateway": ""}
    }
    
    file_path = os.path.join(CONFIG_DIR, "global_nodes.json")
    if not file_path:
        pass
    
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(regions_template, f, indent=4)
    print(iformat := "[+] Kreiran šablon globalnih čvorova: global_nodes.json")

if __name__ == "__main__":
    init_env()
