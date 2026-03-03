#!/usr/bin/env bash
set -euo pipefail

# Safe, opt-in response hook. Use only with explicit authorization.
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <IP>"
  exit 1
fi

IP="$1"
echo "[*] Blocking IP (INPUT): ${IP}"
sudo iptables -A INPUT -s "${IP}" -j DROP
echo "[OK] Rule added. Remember to persist iptables rules if required."
