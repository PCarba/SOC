# 🛡 Modular SOC Platform

This is my final degree project, a modular and scalable Security Operations Center (SOC) deployment framework designed for small and medium-sized enterprises (SMEs).

    This project provides:

        Automated SOC deployment

        IDS/IPS configuration

        Endpoint monitoring

        Log centralization

        Compliance-oriented dashboards

        AI-driven threat analysis and alert summarization

        Automated response capabilities

🔧 Technologies Used

    Security Onion

    Suricata (IDS/IPS)

    Zeek (Network Analysis)

    Wazuh (Endpoint Detection & Response)

    Elastic Stack (SIEM)

    Docker

    Bash Automation

    Python

    OpenAI / ShellGPT integration

🚀 Deployment Guide
    
       1️⃣ System Requirements

            Ubuntu Server 22.04 LTS

            8+ vCPU

            16GB+ RAM

            250GB+ Storage

            Network TAP / SPAN Port recommended

    
       2️⃣ Quick Installation
            git clone https://github.com/PCarba/SOC/Modular-SOC-Platform.git
            cd Modular-SOC-Platform
            chmod +x scripts/install_soc.sh
            sudo ./scripts/install_soc.sh
🔐 install_soc.sh (REAL SCRIPT)
#!/bin/bash

echo "[+] Updating system..."
apt update && apt upgrade -y

echo "[+] Installing dependencies..."
apt install -y curl wget git docker.io python3 python3-pip

echo "[+] Installing Security Onion..."
curl -L https://securityonion.net/install.sh | bash

echo "[+] Deploying Docker services..."
docker-compose -f infrastructure/docker-compose.yml up -d

echo "[+] Installation completed."


📁 ai/llm_alert_summary.py
import openai
import json

openai.api_key = "YOUR_API_KEY"

def summarize_alert(alert_json):
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a SOC analyst assistant."},
            {"role": "user", "content": f"Summarize this security alert:\n{alert_json}"}
        ]
    )
    return response.choices[0].message.content
🧠 AI-Driven Anomaly Detection
ai/anomaly_detection.py
import pandas as pd
from sklearn.ensemble import IsolationForest

def detect_anomalies(log_file):
    df = pd.read_csv(log_file)
    model = IsolationForest(contamination=0.01)
    df['anomaly'] = model.fit_predict(df[['bytes_sent','bytes_received']])
    return df[df['anomaly'] == -1]
🧠 ShellGPT Integration (SOC Chat Interface)
ai/shellgpt_integration.sh
#!/bin/bash

echo "Describe the incident:"
read incident

sgpt "As a SOC analyst, analyze this incident and provide next steps: $incident"
🔥 Automated Response Script
scripts/auto_response.sh
#!/bin/bash

IP=$1

echo "[+] Blocking malicious IP: $IP"
iptables -A INPUT -s $IP -j DROP

echo "[+] IP blocked successfully."
📊 SOC Health Check
scripts/health_check.sh
#!/bin/bash

echo "Checking Suricata..."
systemctl status suricata | grep Active

echo "Checking Wazuh..."
systemctl status wazuh-manager | grep Active

echo "Checking Elasticsearch..."
systemctl status elasticsearch | grep Active
📈 Why This Project Is Attractive for Recruiters

Shows SOC architecture knowledge

Demonstrates automation capability

Integrates AI in cybersecurity
