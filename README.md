# Cybersecurity Labs Portfolio

A hands-on cybersecurity portfolio documenting practical labs across SOC investigation, endpoint monitoring, network detection, offensive security, and incident response.

This repository is being built to demonstrate real security analysis skills through repeatable lab work, screenshots, structured notes, and investigation-style write-ups.

The focus is not just on completing tools or tutorials. The focus is on showing how security events are generated, detected, investigated, explained, and documented.

---

## Portfolio Focus

This portfolio demonstrates practical experience in:

- SOC-style alert investigation
- Wazuh dashboard analysis
- Endpoint monitoring with Sysmon
- Windows event log review
- Network detection using Suricata and Zeek
- Vulnerability and attack simulation labs
- Basic penetration testing methodology
- Incident response documentation
- Evidence collection using screenshots and written findings

---

## Completed Labs

| Lab | Topic | Skills Demonstrated |
|---|---|---|
| [Lab 1: Penetration Testing Basics](lab-1-pentest.md) | Offensive security foundations | Reconnaissance, scanning, testing methodology |
| [Lab 2: Suricata and Zeek Network Detection](lab-2-suricata-zeek.md) | Network detection | IDS alerts, packet/log analysis, detection workflow |
| [Lab 3: Windows Incident Response](lab-3-windows-incident-response.md) | Incident response | Windows investigation, malware-remediation style workflow |
| [Lab 4: SQL Injection Login Bypass](lab-4-sql-injection-login-bypass.md) | Web application security | SQL injection concepts, login bypass testing, OWASP basics |
| [Lab 5: Windows Firewall Nmap Detection](lab-5-windows-firewall-nmap-detection.md) | Network scanning detection | Nmap scanning, Windows Firewall behaviour, detection notes |
| [Lab 6: Suspicious PowerShell Investigation with Wazuh and Sysmon](scenario-1-powershell-investigation.md) | SOC investigation | Wazuh, Sysmon, PowerShell activity review, alert expansion, evidence capture |

---

## Current SOC Lab Series

I am currently building a Wazuh-based SOC lab series using virtual machines and controlled attack/detection scenarios.

Planned scenarios include:

1. **Suspicious PowerShell Investigation**  
   Completed. Investigated PowerShell activity from a Windows VM using Wazuh, Sysmon, Windows Event Logs, and Wazuh dashboard evidence.

2. **SSH Brute Force Detection**  
   Planned. Kali attacker machine against a Linux victim, with detection and evidence reviewed in Wazuh.

3. **File Integrity Monitoring / Web Shell Detection**  
   Planned. Monitoring unexpected file changes and suspicious web activity.

4. **Suricata Integration**  
   Planned. Network IDS alerting and investigation workflow.

5. **Vulnerability Detection**  
   Planned. Vulnerability visibility, triage, and reporting using security tooling.

---

## Tools & Technologies

- Wazuh
- Wazuh Dashboard
- Wazuh Agent
- Sysmon
- Windows Event Logs
- VMware Workstation Pro
- Windows virtual machines
- Linux virtual machines
- Kali Linux
- Kali Purple
- Nmap
- Suricata IDS/IPS
- Zeek Network Security Monitor
- Burp Suite
- OWASP Juice Shop
- Docker
- GitHub documentation workflows

---

## Investigation Methodology

Most labs follow this structure:

1. Define the objective
2. Build or configure the lab environment
3. Generate controlled activity or simulate an attack
4. Capture security telemetry
5. Investigate logs, alerts, or events
6. Record evidence using screenshots
7. Write findings in a clear analyst-style format
8. Summarise what was learned and what could be improved

---

## Why This Repository Exists

I am building this portfolio to show practical cybersecurity capability beyond certificates.

The aim is to demonstrate that I can:

- Work through real technical problems
- Configure security tools in a lab environment
- Investigate alerts and logs
- Explain what happened clearly
- Document evidence professionally
- Keep improving through hands-on practice

---

## Next Improvements

- Add more Wazuh SOC investigation scenarios
- Improve each lab with clearer screenshots and evidence sections
- Add incident report summaries for each completed scenario
- Build a stronger structure for blue team and offensive security labs
- Continue developing this into a job-ready cybersecurity portfolio

---

## Status

This repository is actively being developed as I build deeper capability across SOC analysis, detection engineering, endpoint monitoring, incident response, and offensive security fundamentals.
