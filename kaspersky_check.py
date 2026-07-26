import json
import datetime

def check_alternatives():
    alternatives = {
        "Global_USA": ["CrowdStrike", "Microsoft Defender", "SentinelOne", "Palo Alto Networks"],
        "EU": ["Bitdefender", "ESET", "F-Secure / WithSecure"]
    }
    
    data = {
        "timestamp": str(datetime.datetime.now()),
        "repository": "djordje-kaspersky",
        "status": "active",
        "endpoint_protections": alternatives
    }
    
    filename = "kaspersky_alternatives.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    
    print(f"Podaci uspješno spremljeni u {filename}")

if __name__ == "__main__":
    check_alternatives()
