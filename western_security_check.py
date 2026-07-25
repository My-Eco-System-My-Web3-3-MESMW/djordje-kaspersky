import json
import datetime

def check_western_ecosystem():
    model_data = {
        "region": "USA_and_EU",
        "characteristics": [
            "Fokus na komercijalne ekosustave visoke vrijednosti",
            "Stroge propise o privatnosti poput GDPR-a",
            "Integracija s cloud rješenjima AWS, Azure, Google Cloud"
        ],
        "key_players": [
            "Microsoft",
            "CrowdStrike",
            "Palo Alto Networks",
            "Cloudflare",
            "Fortinet",
            "Bitdefender",
            "ESET"
        ]
    }
    
    data = {
        "timestamp": str(datetime.datetime.now()),
        "repository": "djordje-kaspersky",
        "category": "western_security_model",
        "details": model_data
    }
    
    filename = "western_security.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    
    print(f"Podaci uspješno spremljeni u {filename}")

if __name__ == "__main__":
    check_western_ecosystem()
