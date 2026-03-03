# 🛡 Modular SOC Platform

![SOC](https://img.shields.io/badge/SOC-Modular-blue)
![Security](https://img.shields.io/badge/Cybersecurity-Platform-red)
![Automation](https://img.shields.io/badge/Automation-Enabled-green)
![AI](https://img.shields.io/badge/AI-Integrated-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

A modular and scalable **Security Operations Center (SOC)** deployment framework designed for Small and Medium Enterprises (SMEs).

This project provides:

- Automated SOC deployment
- IDS/IPS configuration
- Endpoint monitoring
- Log centralization (SIEM)
- AI-driven alert analysis
- Automated response scripts
- Compliance-oriented dashboards

---

# 📌 Architecture Overview

The platform integrates:

- **Security Onion** – SOC base platform
- **Suricata (IDS/IPS)** – Network intrusion detection & prevention
- **Zeek** – Network traffic behavioral analysis
- **Wazuh (HIDS)** – Endpoint detection and response
- **Elastic Stack (ELK)** – Log aggregation and visualization
- **Python AI Modules** – Alert classification & anomaly detection
- **ShellGPT integration** – Natural language SOC assistant

---

# 🚀 Quick Deployment

## 1️⃣ Clone the repository

```bash
git clone https://github.com/PCarba/SOC.git
cd Modular-SOC-Platform
```

## 2️⃣ Run installation script

```bash
chmod +x scripts/install_soc.sh
sudo ./scripts/install_soc.sh
```

---

# 🖥 System Requirements

- Ubuntu Server 22.04 LTS
- 8 vCPU minimum
- 16GB RAM recommended
- 250GB storage
- SPAN / Mirror port recommended for NIDS

---

# 🔐 SOC Installation Script

```bash
#!/bin/bash

echo "[+] Updating system..."
apt update && apt upgrade -y

echo "[+] Installing base dependencies..."
apt install -y curl wget git docker.io python3 python3-pip

echo "[+] Installing Security Onion..."
curl -L https://securityonion.net/install.sh | bash

echo "[+] Starting infrastructure..."
docker-compose -f infrastructure/docker-compose.yml up -d

echo "[✓] SOC Installation Complete."
```

---

# 🤖 AI Alert Summarization Module

```python
import openai
import json

openai.api_key = "YOUR_API_KEY"

def summarize_alert(alert_json):
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a senior SOC analyst."},
            {"role": "user", "content": f"Summarize this alert and suggest next steps:\n{alert_json}"}
        ]
    )
    return response.choices[0].message.content
```

---

# 🧠 Anomaly Detection (Machine Learning)

```python
import pandas as pd
from sklearn.ensemble import IsolationForest

def detect_anomalies(log_file):
    df = pd.read_csv(log_file)
    model = IsolationForest(contamination=0.01)
    df['anomaly'] = model.fit_predict(df[['bytes_sent','bytes_received']])
    return df[df['anomaly'] == -1]
```

---

# 🔥 Automated IP Blocking

```bash
#!/bin/bash

IP=$1

echo "[+] Blocking malicious IP: $IP"
iptables -A INPUT -s $IP -j DROP

echo "[✓] IP successfully blocked."
```

Usage:

```bash
sudo ./scripts/auto_response.sh 192.168.1.100
```

---

# 🧠 ShellGPT SOC Assistant

```bash
#!/bin/bash

echo "Describe the incident:"
read incident

sgpt "As a SOC analyst, analyze this security incident and provide response steps: $incident"
```

---

# 📊 Health Check Script

```bash
#!/bin/bash

echo "Checking Suricata..."
systemctl status suricata | grep Active

echo "Checking Wazuh..."
systemctl status wazuh-manager | grep Active

echo "Checking Elasticsearch..."
systemctl status elasticsearch | grep Active
```

---

# 📈 Compliance Alignment

The project aligns with:

- GDPR (General Data Protection Regulation)
- ENS (Spanish National Security Framework)
- ISO/IEC 27001
- MITRE ATT&CK framework

---


# 👨‍💻 Author

**Pablo Carballeira Baamonde**  
Graduate in Networked Computer Systems Administration
 

---

# ⚠ Disclaimer

This project is intended for educational and research purposes.  
Always deploy responsibly and in controlled environments.
