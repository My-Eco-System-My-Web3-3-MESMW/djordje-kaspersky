import json
import datetime

def check_australia_ecosystem():
    model_data = {
        "region": "Australia",
        "characteristics": [
            "Visoko regulirano tržište usklađeno s Five Eyes obavještajnim standardima",
            "Veliki naglasak na zaštitu rudarskog sektora, financija i vladinih struktura"
        ],
        "key_players": [
            "CyberCX",
            "Lokalni uredi globalnih divova Microsoft, CrowdStrike, Thales Australia koji blisko surađuju s ACSC"
        ]
    }
    
    data = {
        "timestamp": str(datetime.datetime.now()),
        "repository": "djordje-kaspersky",
        "category": "australia_security_model",
        "details": model_data
    }
    
    filename = "australia_security.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    
    print(f"Podaci uspješno spremljeni u {filename}")

if __name__ == "__main__":
    check_australia_ecosystem()
