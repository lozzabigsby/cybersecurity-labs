# Cybersecurity Labs Portfolio

![Wazuh](https://img.shields.io/badge/Wazuh-SIEM-blue)
![Sysmon](https://img.shields.io/badge/Sysmon-Endpoint%20Telemetry-green)
![Kali Linux](https://img.shields.io/badge/Kali-Linux-purple)
![SOC](https://img.shields.io/badge/SOC-Investigations-red)
![Blue Team](https://img.shields.io/badge/Blue-Team-darkblue)
![Incident Response](https://img.shields.io/badge/Incident-Response-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Cyber%20Risk%20Reporting-yellow)
![Suricata](https://img.shields.io/badge/Suricata-Network%20Detection-lightgrey)
![pfSense](https://img.shields.io/badge/pfSense-Network%20Segmentation-212121)
![Burp Suite](https://img.shields.io/badge/Burp%20Suite-Web%20Security-orange)

Practical cybersecurity labs covering SOC investigation, detection engineering, incident response, Active Directory security, and cyber risk reporting. Each write-up connects the technical work with evidence, findings, and lessons learned.

**13 lab write-ups · 2 Power BI dashboards**

[Featured projects](#featured-projects) · [All labs](#lab-index) · [Power BI dashboards](#power-bi-dashboards) · [Architecture](DIAGRAMS.md) · [Repository guide](STRUCTURE.md)

---

## Featured Projects

Start with these projects to follow the progression from building a monitored domain to investigating and containing a simulated incident.

| Project | What it demonstrates |
|---|---|
| [Lab 13 - SOC Incident Investigation](lab-13-soc-incident-investigation.md) | SMB authentication and encoded PowerShell investigation, event correlation, MITRE mapping, and verified containment |
| [Lab 12 - Operation Blackout](lab-12-operation-blackout.md) | pfSense segmentation, Active Directory controls, and Wazuh/Sysmon monitoring across security zones |
| [Lab 11 - Active Directory Security Monitoring](lab-11-active-directory-wazuh-detection.md) | Domain deployment, Windows auditing, endpoint telemetry, and custom detection validation |
| [Lab 10 - Wazuh and Suricata Integration](lab-10-wazuh-suricata-network-detection.md) | Network detection, Nmap traffic analysis, and SIEM alert validation |

## Lab Index

| Lab | Area | Write-up |
|---|---|---|
| Lab 1 | Lab setup / reconnaissance | [OWASP Juice Shop Setup, Reconnaissance and Traffic Capture](lab-1-juice-shop-recon-traffic-capture.md) |
| Lab 2 | Network detection | [Suricata and Zeek Network Detection](lab-2-suricata-zeek.md) |
| Lab 3 | Incident response | [Windows Incident Response](lab-3-windows-incident-response.md) |
| Lab 4 | Web exploitation | [SQL Injection Login Bypass](lab-4-sql-injection-login-bypass.md) |
| Lab 5 | Windows logging | [Windows Firewall Nmap Detection](lab-5-windows-firewall-nmap-detection.md) |
| Lab 6 - Scenario 1 | SOC / endpoint monitoring | [Suspicious PowerShell Investigation](lab-6-scenario-1-powershell-investigation.md) |
| Lab 7 - Scenario 2 | SOC / Linux authentication | [SSH Brute Force Detection](lab-7-scenario-2-ssh-brute-force-detection.md) |
| Lab 8 - Scenario 3 | SOC / file integrity monitoring | [File Integrity Monitoring and Web Shell Detection](lab-8-scenario-3-file-integrity-webshell-detection.md) |
| Lab 9 | Vulnerability management | [Wazuh Vulnerability Detection and CVE Investigation](lab-9-wazuh-vulnerability-detection-cve-investigation.md) |
| Lab 10 - Scenario 4 | Network IDS / SIEM integration | [Wazuh Suricata Network Detection Integration](lab-10-wazuh-suricata-network-detection.md) |
| Lab 11 | Active Directory / detection engineering | [Active Directory Security Monitoring and Wazuh Detection Engineering](lab-11-active-directory-wazuh-detection.md) |
| Lab 12 | Network segmentation / Active Directory detection | [Operation Blackout: Segmented Active Directory Detection Lab](lab-12-operation-blackout.md) |
| Lab 13 | SOC investigation / containment | [Suspicious SMB Authentication Followed by Encoded PowerShell Discovery on WS01](lab-13-soc-incident-investigation.md) |

## Power BI Dashboards

These dashboards show how cybersecurity data can be converted into clear operational and executive reporting.

| Dashboard | Focus Area |
|---|---|
| [Financial Cybersecurity Risk Dashboard](power-bi-dashboards/financial-cybersecurity-risk-dashboard/README.md) | Executive cyber risk reporting for financial services, including active incidents, incident status, response trends, average risk score, and risk summary insights |
| [Security Risk Overview Dashboard](power-bi-dashboards/security-risk-overview-dashboard/README.md) | Vulnerability management reporting, including total vulnerabilities, open vulnerabilities, critical findings, CVSS scoring, remediation status, and risk trends |


## Skills Demonstrated

| Area | Portfolio evidence |
|---|---|
| SOC investigation | Authentication analysis, process telemetry, alert triage, timeline correlation, and MITRE ATT&CK interpretation |
| Detection engineering | Wazuh and Sysmon integration, Suricata and Zeek monitoring, and custom rule validation |
| Active Directory security | Domain administration, Group Policy, role-based access, Windows auditing, and privileged-group monitoring |
| Incident response | Evidence-led findings, firewall containment, and validation from the originating network |
| Vulnerability management | CVE filtering, package review, Wazuh CTI triage, and remediation reporting |
| Web application testing | OWASP Juice Shop reconnaissance, Burp Suite traffic capture, and SQL injection testing |
| Cyber risk reporting | Power BI dashboards, KPI design, and executive-level security communication |

## Technical Tooling

| Category | Tools and Platforms |
|---|---|
| SIEM and monitoring | Wazuh, Wazuh Dashboard, Wazuh File Integrity Monitoring, Wazuh Vulnerability Detection, Wazuh CTI |
| Endpoint telemetry | Sysmon, Windows Event Logs, Windows Defender Firewall |
| Network detection | Suricata, Zeek, Nmap |
| Offensive testing | Kali Linux, Kali Purple, Hydra, Burp Suite, OWASP Juice Shop |
| Systems and lab environment | Windows Server, Active Directory, Group Policy, pfSense, Ubuntu Linux, Apache2, VMware Workstation Pro |
| Reporting and analytics | Power BI, DAX, Power Query, cybersecurity KPI reporting |


## Repository Guide

Lab reports live in the repository root. Supporting screenshots are grouped under `labs/`, and dashboard projects live under `power-bi-dashboards/`.

- [Structure and documentation conventions](STRUCTURE.md)
- [Architecture diagrams](DIAGRAMS.md)
- [Image reorganisation script](scripts/reorganise-images.ps1)

## Ongoing Development

Planned additions include Linux investigations, detection-rule tuning, further threat hunting, and expanded Power BI reporting. Completed work is listed in the lab index above.
