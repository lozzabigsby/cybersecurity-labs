# Cybersecurity Lab Architecture Diagrams

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
