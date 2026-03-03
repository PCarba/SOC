# Requires PowerShell as Administrator
param(
  [string]$ManagerIP = "192.0.2.10",
  [string]$AgentName = "windows-endpoint-01"
)

Write-Host "[*] Wazuh Windows agent deployment template"
Write-Host "Manager: $ManagerIP | Agent: $AgentName"
Write-Host ""
Write-Host "Follow official Wazuh Windows agent install docs for your version."
