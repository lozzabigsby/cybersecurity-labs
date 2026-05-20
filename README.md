# Cybersecurity Labs Portfolio

![Wazuh](https://img.shields.io/badge/Wazuh-SIEM-blue)
![Sysmon](https://img.shields.io/badge/Sysmon-Endpoint%20Telemetry-green)
![Kali Linux](https://img.shields.io/badge/Kali-Linux-purple)
![SOC](https://img.shields.io/badge/SOC-Investigations-red)
![Blue Team](https://img.shields.io/badge/Blue-Team-darkblue)
![Incident Response](https://img.shields.io/badge/Incident-Response-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Cyber%20Risk%20Reporting-yellow)
![Suricata](https://img.shields.io/badge/Suricata-Network%20Detection-lightgrey)
![Burp Suite](https://img.shields.io/badge/Burp%20Suite-Web%20Security-orange)

This repository is a practical cybersecurity portfolio covering SOC investigations, detection engineering, incident response, web application testing, vulnerability management, and cybersecurity reporting.

It is designed to show hands-on technical ability as well as the ability to communicate security findings clearly for business and operational decision-making.

---

# Portfolio Snapshot

| Area | Evidence in this Repository |
|---|---|
| SOC investigation | Wazuh, Sysmon, Linux authentication logs, alert triage, endpoint monitoring |
| Detection engineering | Suricata, Zeek, Nmap detection, Windows firewall log review, custom rule validation |
| Vulnerability management | Wazuh vulnerability detection, CVE investigation, package-level triage, CVSS reporting |
| Incident response | Windows investigation workflow, persistence review, containment thinking |
| Offensive security | OWASP Juice Shop reconnaissance, Burp Suite traffic capture, SQL injection testing |
| Cybersecurity reporting | Power BI dashboards for cyber risk, incidents, vulnerabilities, and executive summaries |

---

# Featured Projects

These are the strongest projects to review first.

| Project | Why It Matters |
|---|---|
| [Lab 10 - Wazuh Suricata Network Detection Integration](lab-10-wazuh-suricata-network-detection.md) | Shows SIEM and IDS integration, Nmap traffic detection, Suricata alert validation, and practical network monitoring workflow |
| [Lab 9 - Wazuh Vulnerability Detection and CVE Investigation](lab-9-wazuh-vulnerability-detection-cve-investigation.md) | Shows vulnerability detection, CVE filtering, package review, and Wazuh CTI triage |
| [Financial Cybersecurity Risk Dashboard](power-bi-dashboards/financial-cybersecurity-risk-dashboard/README.md) | Shows how cybersecurity data can be turned into executive-level Power BI risk reporting |
| [Security Risk Overview Dashboard](power-bi-dashboards/security-risk-overview-dashboard/README.md) | Shows vulnerability management reporting using Power BI, including open findings, critical risk, CVSS scoring, and remediation visibility |

---

# What This Portfolio Demonstrates

This portfolio demonstrates practical ability across three connected areas:

1. **Technical cybersecurity investigation**
   - identifying suspicious activity
   - reviewing logs and alerts
   - validating detection output
   - documenting evidence clearly

2. **Security monitoring and detection**
   - working with SIEM-style tooling
   - integrating endpoint and network telemetry
   - testing alerts using controlled lab activity
   - analysing authentication, firewall, web, and network events

3. **Cybersecurity reporting and communication**
   - building Power BI dashboards
   - reporting cyber risk to non-technical stakeholders
   - presenting incident, vulnerability, and risk metrics clearly
   - connecting technical findings to business impact

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

# Technical Tooling

| Category | Tools and Platforms |
|---|---|
| SIEM and monitoring | Wazuh, Wazuh Dashboard, Wazuh File Integrity Monitoring, Wazuh Vulnerability Detection, Wazuh CTI |
| Endpoint telemetry | Sysmon, Windows Event Logs, Windows Defender Firewall |
| Network detection | Suricata, Zeek, Nmap |
| Offensive testing | Kali Linux, Kali Purple, Hydra, Burp Suite, OWASP Juice Shop |
| Systems and lab environment | Ubuntu Linux, Apache2, VMware Workstation Pro |
| Reporting and analytics | Power BI, DAX, Power Query, cybersecurity KPI reporting |

---

# Skills Demonstrated

| Skill Area | Evidence |
|---|---|
| Security event investigation | Wazuh and Sysmon alert review, suspicious PowerShell investigation, authentication monitoring |
| Threat hunting | Endpoint, Linux, firewall, and web server activity review |
| Vulnerability management | Wazuh vulnerability detection, CVE filtering, CTI review, package-level analysis |
| Network traffic analysis | Suricata and Zeek monitoring, Nmap activity validation, IDS alert review |
| Incident response | Windows investigation workflow, persistence analysis, containment reasoning |
| Web application testing | OWASP Juice Shop reconnaissance, Burp Suite capture, SQL injection login bypass |
| Documentation | Structured lab reports, screenshots, investigation notes, repeatable workflows |
| Cyber risk reporting | Power BI dashboards, KPI design, vulnerability reporting, executive-level security communication |

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
- More incident write-ups using clear evidence, finding, impact, and recommendation sections

---

# Ongoing Development

This portfolio will continue expanding as I build deeper practical capability across cybersecurity, detection engineering, SOC operations, endpoint monitoring, vulnerability management, incident response, and security reporting.
