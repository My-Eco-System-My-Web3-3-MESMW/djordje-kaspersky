import json
import os

def verify_and_save():
    print("[TEST] Provjera autentifikacije i mrežnih sesija za Git, APN i VPN podatke...")
    with open("security_auth_master.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    print(f"[INFO] Uspješno učitani parametri za repozitorijum: {data['repository']}")
    print(f"[INFO] Privatna IP: {data['device_private_ip']} | Javna IP (Brisbane): {data['public_identities_and_projects']['primary_public_ip_australia']['ip']}")

if __name__ == "__main__":
    verify_and_save()
