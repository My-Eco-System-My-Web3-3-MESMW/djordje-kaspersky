import json
import datetime

def check_open_source_tools():
    tools = {
        "Secret_Detection": ["Gitleaks", "Trivy", "Checkov"],
        "SIEM_Monitoring": ["Wazuh", "OpenSearch", "Elastic Security"]
    }
    
    data = {
        "timestamp": str(datetime.datetime.now()),
        "repository": "djordje-kaspersky",
        "category": "open_source_and_api_keys",
        "security_tools": tools
    }
    
    filename = "open_source_security.json"
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    
    print(f"Podaci uspješno spremljeni u {filename}")

if __name__ == "__main__":
    check_open_source_tools()
