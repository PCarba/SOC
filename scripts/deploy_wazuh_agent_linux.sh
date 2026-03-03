#!/usr/bin/env bash
set -euo pipefail

# NOTE: This is a helper template. You must set MANAGER_IP and AGENT_NAME.
MANAGER_IP="${MANAGER_IP:-192.0.2.10}"
AGENT_NAME="${AGENT_NAME:-linux-endpoint-01}"

echo "[*] Installing Wazuh agent (template)"
echo "Manager: ${MANAGER_IP} | Agent: ${AGENT_NAME}"
echo
echo "This script is intentionally conservative. Follow official Wazuh docs for your version."
echo "Place enrollment steps here (package install + registration)."
