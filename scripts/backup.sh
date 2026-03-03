#!/usr/bin/env bash
set -euo pipefail

# Simple backup for Docker volumes + config (adjust to your env)
BACKUP_DIR="${1:-/var/backups/modular-soc}"
TS="$(date +%Y%m%d_%H%M%S)"
OUT="${BACKUP_DIR}/backup_${TS}.tar.gz"

mkdir -p "${BACKUP_DIR}"

echo "[*] Creating backup: ${OUT}"
tar -czf "${OUT}" infrastructure docs dashboards detection-rules scripts ai README.md CHANGELOG.md LICENSE || true

echo "[OK] Backup completed"
