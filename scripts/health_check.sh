#!/usr/bin/env bash
set -euo pipefail

echo "[*] Checking Docker..."
docker info >/dev/null 2>&1 && echo "[OK] Docker reachable" || { echo "[ERR] Docker not reachable"; exit 1; }

echo "[*] Checking stack containers..."
docker compose -f infrastructure/docker-compose.yml ps

echo "[*] Basic HTTP checks (best-effort)..."
SIEM_PORT="${SIEM_HTTP_PORT:-5601}"
if command -v curl >/dev/null 2>&1; then
  curl -fsS "http://localhost:${SIEM_PORT}" >/dev/null && echo "[OK] Kibana reachable on :${SIEM_PORT}" || echo "[WARN] Kibana not reachable yet"
  curl -fsS "http://localhost:9200" >/dev/null && echo "[OK] Elasticsearch reachable on :9200" || echo "[WARN] Elasticsearch not reachable yet"
else
  echo "[WARN] curl not installed; skipping HTTP checks"
fi
