# Architecture

## Components
- SIEM stack (Docker Compose template)
- Endpoint agents (Wazuh)
- Optional NIDS (Suricata/Zeek)
- Automation scripts

## Data flow
1) Endpoints -> agent -> manager/indexer
2) Network sensor -> logs -> SIEM
3) Dashboards -> analyst
