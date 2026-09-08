# Cybersecurity Lab Architecture Diagrams

[Back to the portfolio](README.md)

## Active Directory and SOC Investigation Labs

| Lab | Architecture |
|---|---|
| [Lab 11 - Active Directory Security Monitoring](lab-11-active-directory-wazuh-detection.md#architecture) | Original monitored domain and endpoint-to-Wazuh telemetry flow |
| [Lab 12 - Operation Blackout](lab-12-operation-blackout.md#architecture) | Corporate, Security, and Attack networks routed through pfSense |
| [Lab 13 - SOC Incident Investigation](lab-13-soc-incident-investigation.md#architecture) | Controlled SMB test path, local execution simulation, and investigation telemetry |

These reports contain the environment-specific diagrams and addressing plans. The diagrams below summarise the earlier monitoring workflows.

## Wazuh SOC Lab Architecture

```text
+-------------------+
| Kali Linux        |
| Attacker Machine  |
+---------+---------+
          |
          | SSH / Hydra / Nmap
          |
+---------v---------+
| Ubuntu Victim VM  |
| Wazuh Agent       |
+---------+---------+
          |
          | Security Events
          |
+---------v---------+
| Wazuh Manager     |
| Wazuh Dashboard   |
| Detection Engine  |
+-------------------+
```

---

## Windows Endpoint Monitoring Architecture

```text
+-------------------+
| Windows Victim VM |
| Sysmon Installed  |
+---------+---------+
          |
          | Sysmon Events
          |
+---------v---------+
| Wazuh Agent       |
+---------+---------+
          |
          | Endpoint Telemetry
          |
+---------v---------+
| Wazuh Manager     |
| Wazuh Dashboard   |
+-------------------+
```

---

## Network Detection Lab

```text
+-------------------+
| Internet / Test   |
| Network Traffic   |
+---------+---------+
          |
          v
+-------------------+
| Suricata          |
| IDS / IPS Alerts  |
+-------------------+

+-------------------+
| Zeek              |
| Metadata Analysis |
+-------------------+
```
