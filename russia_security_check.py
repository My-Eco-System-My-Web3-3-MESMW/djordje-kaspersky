import json
import datetime

def check_russia_ecosystem():
    model_data = {
        "region": "Russia",
        "characteristics": [
            "Fokus na tehnološku neovisnost i importazameščenie zbog geopolitičkih okolnosti i sankcija"
        ],
        "key_players": [
            "Kaspersky Lab",
            "Positive Technologies",
            "Dr.Web"
        ]
    }
    
    data = {
        "timestamp": str(datetime.datetime.now()),
        "repository": "djordje-kaspersky",
        "category": "russia_security_model",
        "details": model_data
    }
    
    filename = "russia_security.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    
    print(f"Podaci uspješno spremljeni u {filename}")

if __name__ == "__main__":
    check_russia_ecosystem()
