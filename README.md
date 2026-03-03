# 🛡️ Modular SOC Platform
**Deployable SOC building blocks** for SMEs: log collection, detection, dashboards, automation, and optional AI-assisted triage.

> **Goal**: Provide a clean, reproducible reference implementation and tooling to deploy a SOC stack in a customer environment (on-prem or lab) using open-source components.

![SOC](https://img.shields.io/badge/SOC-Modular-blue)
![Automation](https://img.shields.io/badge/Automation-Scripts-green)
![Infra](https://img.shields.io/badge/Infrastructure-Docker%20Compose-orange)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## ✨ What’s inside

### Core capabilities
- **Centralized logging** (SIEM layer) with dashboards
- **Endpoint telemetry** (Linux/Windows) via agents
- **Network detection** (Suricata/Zeek) optional
- **Health checks, backups, and baseline hardening**
- **Automation hooks** for response actions (safe, opt-in)

### AI-assisted (optional)
- Alert summarization / ticket drafting
- Triage suggestions (next steps)
- Natural-language helper using ShellGPT *(optional integration)*

---

## 🧱 Architecture (high level)
- **SIEM/Storage**: Elastic/OpenSearch-compatible stack via Docker Compose *(templates provided)*
- **Endpoint layer**: Wazuh agents (Linux/Windows) *(installers + enrollment helpers)*
- **Network layer** *(optional)*: Suricata (IDS) + Zeek (NSM) on a sensor host
- **Automation**: shell scripts + Python helpers

See: [`docs/architecture.md`](docs/architecture.md)

---

## ✅ Quick start (local / lab)
> This repository provides **templates** and **automation**. You will choose the final stack (Elastic/OpenSearch/Wazuh bundle) according to your environment.

### 1) Clone
```bash
git clone https://github.com/PCarba/Modular-SOC-Platform.git
cd Modular-SOC-Platform
```

### 2) Bring up the SIEM stack (template)
```bash
cp infrastructure/.env.example infrastructure/.env
docker compose -f infrastructure/docker-compose.yml up -d
```

### 3) Check services
```bash
./scripts/health_check.sh
```

### 4) Enroll endpoints (agents)
- Linux: `scripts/deploy_wazuh_agent_linux.sh`
- Windows: `scripts/deploy_wazuh_agent_windows.ps1`

---

## 📦 Folder overview
```text
.
├── docs/                  # Technical docs (architecture, deployment, ops)
├── infrastructure/        # Docker Compose templates + environment file
├── scripts/               # Install, hardening, backup, health checks, response hooks
├── detection-rules/       # Suricata / Wazuh rule templates and notes
├── dashboards/            # Exported dashboard templates (placeholders)
├── ai/                    # Optional AI helpers (summaries, triage)
└── lab/                   # Example log samples + simulation notes (optional)
```

---

## 🔐 Security / Ethics
This project is for **defensive security** and SOC enablement. Any testing must be performed **only** on systems you own or have explicit authorization to test.

See: [`SECURITY.md`](SECURITY.md)

---

## 🧪 Operational notes
- Review `infrastructure/docker-compose.yml` and set credentials in `infrastructure/.env`
- Place this stack **behind a firewall**, restrict access, enable TLS
- Maintain updates and backups (see `scripts/backup.sh`)

---

## 🗺️ Roadmap
- MITRE ATT&CK mapping for detections
- SOAR-style playbooks (opt-in)
- Threat intel ingestion templates
- CI checks (shellcheck, python lint)

---

## 👤 Author
**Pablo Carballeira Baamonde**  
GitHub: `PCarba`  
Brand: **PCarba Works**
