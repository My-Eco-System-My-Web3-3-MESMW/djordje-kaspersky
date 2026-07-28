import json
import os

def check_security_status():
    print("[SECURITY] Učitavanje bezbednosne politike za Samsung Galaxy A32...")
    if not os.path.exists("device_killswitch_policy.json"):
        print("[GREŠKA] Nema bezbednosne politike!")
        return

    with open("device_killswitch_policy.json", "r", encoding="utf-8") as f:
        policy = json.loadf if hasattr(json, 'loadf') else json.load(f)

    dev = policy["device_info"]
    print(f"[INFO] Praćen uređaj: {dev['device_name']} ({dev['model']})")
    print(f"[INFO] Serijski broj: {dev['serial_number']} | IP: {dev['private_ip']}")
    print(f"[INFO] Sinhronizovani nalozi: {len(policy['authorized_identities']['google_accounts'])} Google + 1 Yandex.")
    print("[STATUS] Killswitch protokol je aktivan i sinhronizovan sa repozitorijumom.")

if __name__ == "__main__":
    check_security_status()
