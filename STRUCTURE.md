# Repository Structure

This repository is organised as a cybersecurity portfolio rather than a loose file dump.

## Current layout

The main lab write-ups currently live as Markdown files in the repository root for easy portfolio navigation.

Screenshot evidence is stored inside lab-specific folders under `labs/`, so the repository root stays clean while each investigation keeps its supporting evidence organised.

## Lab index

| Lab | Area | Write-up |
|---|---|---|
| Lab 1 | Web application security | [Web Application Security Testing Basics](lab-1-web-application-security-testing-basics.md) |
| Lab 2 | Network detection | [Suricata and Zeek Network Detection](lab-2-suricata-zeek.md) |
| Lab 3 | Incident response | [Windows Incident Response](lab-3-windows-incident-response.md) |
| Lab 4 | Web security | [SQL Injection Login Bypass](lab-4-sql-injection-login-bypass.md) |
| Lab 5 | Windows logging | [Windows Firewall Nmap Detection](lab-5-windows-firewall-nmap-detection.md) |
| Lab 6 - Scenario 1 | SOC / endpoint monitoring | [Suspicious PowerShell Investigation](lab-6-scenario-1-powershell-investigation.md) |
| Lab 7 - Scenario 2 | SOC / Linux authentication | [SSH Brute Force Detection](lab-7-scenario-2-ssh-brute-force-detection.md) |
| Lab 8 - Scenario 3 | SOC / file integrity monitoring | [File Integrity Monitoring and Web Shell Detection](lab-8-scenario-3-file-integrity-webshell-detection.md) |
| Lab 9 | Vulnerability management | [Wazuh Vulnerability Detection and CVE Investigation](lab-9-wazuh-vulnerability-detection-cve-investigation.md) |
| Lab 10 - Scenario 4 | Network IDS / SIEM integration | [Wazuh Suricata Network Detection Integration](lab-10-wazuh-suricata-network-detection.md) |

## Scenario grouping

The Wazuh SOC detection series is organised as:

| Scenario | Lab | Focus |
|---|---|---|
| Scenario 1 | Lab 6 | Suspicious PowerShell investigation |
| Scenario 2 | Lab 7 | SSH brute-force detection |
| Scenario 3 | Lab 8 | File integrity monitoring and web shell detection |
| Scenario 4 | Lab 10 | Suricata network detection integration |

Lab 9 sits outside the numbered scenario series because it focuses on vulnerability management and CVE triage rather than attack-detection simulation.

## Current structure

```text
cybersecurity-labs/
├── README.md
├── STRUCTURE.md
├── DIAGRAMS.md
├── lab-1-web-application-security-testing-basics.md
├── lab-2-suricata-zeek.md
├── lab-3-windows-incident-response.md
├── lab-4-sql-injection-login-bypass.md
├── lab-5-windows-firewall-nmap-detection.md
├── lab-6-scenario-1-powershell-investigation.md
├── lab-7-scenario-2-ssh-brute-force-detection.md
├── lab-8-scenario-3-file-integrity-webshell-detection.md
├── lab-9-wazuh-vulnerability-detection-cve-investigation.md
├── lab-10-wazuh-suricata-network-detection.md
├── labs/
│   ├── lab-01-web-application-security-testing-basics/
│   │   ├── lab01-nmap-service-scan.txt
│   │   └── screenshots/
│   ├── lab-05-windows-firewall-nmap-detection/
│   │   └── screenshots/
│   ├── lab-06-wazuh-powershell-investigation/
│   │   └── screenshots/
│   ├── lab-07-wazuh-ssh-bruteforce-detection/
│   │   └── screenshots/
│   ├── lab-08-wazuh-file-integrity-webshell-detection/
│   │   └── screenshots/
│   ├── lab-09-wazuh-vulnerability-detection-cve-investigation/
│   │   └── screenshots/
│   └── lab-10-wazuh-suricata-network-detection/
│       └── screenshots/
└── scripts/
    └── reorganise-images.ps1
```

## Cleanup rules

- Keep one clear README as the portfolio front page.
- Keep each lab write-up consistent: objective, tools, steps, evidence, findings, conclusion, skills demonstrated.
- Store screenshot evidence inside the relevant lab folder.
- Avoid vague labels like `image1.png` where possible.
- Use consistent lab numbering and scenario naming.
- Do not delete screenshot evidence unless the relevant write-up has already been updated.
