#!/usr/bin/env bash
set -euo pipefail

echo "[*] Basic host hardening (safe defaults)."
echo " - Updating packages"
sudo apt-get update -y && sudo apt-get upgrade -y

echo " - Installing baseline tools"
sudo apt-get install -y ufw fail2ban curl git

echo " - Enabling UFW (allow SSH)"
sudo ufw allow OpenSSH
sudo ufw --force enable

echo "[OK] Hardening complete. Review firewall rules before production use."
