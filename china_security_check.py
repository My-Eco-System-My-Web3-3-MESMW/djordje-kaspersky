import json
import datetime

def check_china_ecosystem():
    model_data = {
        "region": "China",
        "characteristics": [
            "Snažan naglasak na nacionalnu kibernetičku suverenost",
            "Stroge zakone o sigurnosti podataka",
            "Masovnu primjenu umjetne inteligencije u nadzoru"
        ],
        "key_players": [
            "Qihoo 360",
            "NSFOCUS",
            "DeepBlue Technology / Venustech"
        ]
    }
    
    data = {
        "timestamp": str(datetime.datetime.now()),
        "repository": "djordje-kaspersky",
        "category": "china_security_model",
        "details": model_data
    }
    
    filename = "china_security.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    
    print(f"Podaci uspješno spremljeni u {filename}")

if __name__ == "__main__":
    check_china_ecosystem()
