# Cybersecurity Labs Portfolio

![Wazuh](https://img.shields.io/badge/Wazuh-SIEM-blue)
![Sysmon](https://img.shields.io/badge/Sysmon-Endpoint%20Telemetry-green)
![Kali Linux](https://img.shields.io/badge/Kali-Linux-purple)
![SOC](https://img.shields.io/badge/SOC-Investigations-red)
![Blue Team](https://img.shields.io/badge/Blue-Team-darkblue)
![Incident Response](https://img.shields.io/badge/Incident-Response-orange)

This repository documents my hands-on cybersecurity labs across offensive and defensive security environments.

The portfolio includes:

- Penetration testing labs
- Windows and Linux investigations
- Wazuh SOC monitoring scenarios
- Network detection and log analysis
- Incident response case studies
- Web application security testing
- Vulnerability detection and CVE triage
- Cybersecurity reporting dashboards using Power BI

The goal of this repository is to demonstrate practical cybersecurity skills through structured investigations, technical documentation, evidence collection, repeatable lab workflows, and business-focused security reporting.

---

# SOC Investigations

## Wazuh Security Monitoring

| Investigation | Focus Area |
|---|---|
| [Lab 6 - Scenario 1: Suspicious PowerShell Investigation](lab-6-scenario-1-powershell-investigation.md) | Endpoint telemetry investigation using Wazuh and Sysmon |
| [Lab 7 - Scenario 2: SSH Brute Force Detection](lab-7-scenario-2-ssh-brute-force-detection.md) | Linux authentication monitoring and SSH brute-force alert investigation |
| [Lab 8 - Scenario 3: File Integrity Monitoring and Web Shell Detection](lab-8-scenario-3-file-integrity-webshell-detection.md) | Wazuh syscheck monitoring for Apache web directory file creation and modification |
| [Lab 9 - Wazuh Vulnerability Detection and CVE Investigation](lab-9-wazuh-vulnerability-detection-cve-investigation.md) | Vulnerability detection, CVE filtering, package review, and Wazuh CTI triage |
| [Lab 10 - Wazuh Suricata Network Detection Integration](lab-10-wazuh-suricata-network-detection.md) | Suricata IDS integration with Wazuh, Nmap traffic detection, and SIEM alert validation |

---

# Detection Engineering & Network Monitoring

| Lab | Description |
|---|---|
| [Lab 2: Suricata and Zeek Network Detection](lab-2-suricata-zeek.md) | IDS alerting, network metadata analysis, and custom Suricata rule creation |
| [Lab 5: Windows Firewall Nmap Detection](lab-5-windows-firewall-nmap-detection.md) | Detecting reconnaissance activity using native Windows firewall logs |

---

# Offensive Security

| Lab | Description |
|---|---|
| [Lab 1: OWASP Juice Shop Setup, Reconnaissance and Traffic Capture](lab-1-juice-shop-recon-traffic-capture.md) | Building the Juice Shop lab target, confirming exposure with Nmap, and capturing baseline HTTP traffic in Burp Suite |
| [Lab 4: SQL Injection Login Bypass](lab-4-sql-injection-login-bypass.md) | Authentication bypass using SQL injection against OWASP Juice Shop |

---

# Incident Response

| Lab | Description |
|---|---|
| [Lab 3: Windows Incident Response](lab-3-windows-incident-response.md) | Malware investigation, persistence analysis, and containment workflow |

---

# Architecture Diagrams

- [Cybersecurity Lab Diagrams](DIAGRAMS.md)

---

# Power BI Cybersecurity Dashboards

These dashboards show how cybersecurity data can be converted into clear operational and executive reporting.

| Dashboard | Focus Area |
|---|---|
| [Financial Cybersecurity Risk Dashboard](power-bi-dashboards/financial-cybersecurity-risk-dashboard/README.md) | Executive cyber risk reporting for financial services, including active incidents, incident status, response trends, average risk score, and risk summary insights |
| [Security Risk Overview Dashboard](power-bi-dashboards/security-risk-overview-dashboard/README.md) | Vulnerability management reporting, including total vulnerabilities, open vulnerabilities, critical findings, CVSS scoring, remediation status, and risk trends |

---

# Technologies & Platforms

- Wazuh
- Wazuh Dashboard
- Wazuh File Integrity Monitoring
- Wazuh Vulnerability Detection
- Wazuh CTI
- Sysmon
- Windows Event Logs
- Kali Linux
- Kali Purple
- Ubuntu Linux
- Apache2
- VMware Workstation Pro
- Suricata
- Zeek
- Nmap
- Hydra
- Burp Suite
- OWASP Juice Shop
- Windows Defender Firewall
- Power BI
- DAX
- Power Query
- Cybersecurity risk reporting

---

# Skills Demonstrated

- Security event investigation
- Endpoint monitoring
- Windows and Linux log analysis
- Threat hunting
- File integrity monitoring
- Web server monitoring
- Vulnerability detection
- CVE triage
- Package-level vulnerability analysis
- Network traffic analysis
- Intrusion detection
- Incident response workflows
- Web application testing
- Firewall log analysis
- SOC investigation methodology
- Security documentation and evidence collection
- Power BI dashboard development
- Cybersecurity KPI reporting
- Vulnerability management reporting
- Executive cyber risk communication

---

# Repository Organisation

Repository cleanup and restructuring notes can be found here:

- [Repository Structure Guide](STRUCTURE.md)
- [Image Reorganisation Script](scripts/reorganise-images.ps1)

---

# Planned Future Labs

- Additional Linux investigation scenarios
- Active Directory attack simulations
- Detection engineering rule tuning
- Threat hunting investigations
- Additional Power BI cybersecurity reporting pages and screenshots

---

# Ongoing Development

This portfolio will continue expanding as I build deeper practical capability across cybersecurity, detection engineering, SOC operations, endpoint monitoring, vulnerability management, incident response, and security reporting.
