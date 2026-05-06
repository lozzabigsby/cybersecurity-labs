# Repository Structure

This repository is being organised as a cybersecurity portfolio rather than a loose file dump.

## Current layout

The main lab write-ups currently live as Markdown files in the repository root. Screenshot evidence also currently lives in the root so existing image links continue to work.

## Lab index

| Lab | Area | Write-up |
|---|---|---|
| Lab 1 | Penetration testing | [Penetration Testing Basics](lab-1-pentest.md) |
| Lab 2 | Network detection | [Suricata and Zeek Network Detection](lab-2-suricata-zeek.md) |
| Lab 3 | Incident response | [Windows Incident Response](lab-3-windows-incident-response.md) |
| Lab 4 | Web security | [SQL Injection Login Bypass](lab-4-sql-injection-login-bypass.md) |
| Lab 5 | Windows logging | [Windows Firewall Nmap Detection](lab-5-windows-firewall-nmap-detection.md) |
| Lab 6 | SOC / endpoint monitoring | [Suspicious PowerShell Investigation](scenario-1-powershell-investigation.md) |
| Lab 7 | SOC / Linux authentication | [SSH Brute Force Detection](lab-7-wazuh-linux-ssh-investigation.md) |

## Target structure

The long-term structure should move toward:

```text
cybersecurity-labs/
├── README.md
├── STRUCTURE.md
├── labs/
│   ├── lab-01-pentest-basics/
│   ├── lab-02-suricata-zeek/
│   ├── lab-03-windows-incident-response/
│   ├── lab-04-sql-injection-login-bypass/
│   ├── lab-05-windows-firewall-nmap-detection/
│   ├── lab-06-wazuh-powershell-investigation/
│   └── lab-07-wazuh-ssh-bruteforce-detection/
└── screenshots/
    ├── lab-05/
    ├── lab-06/
    └── lab-07/
```

## Cleanup rules

- Keep one clear README as the portfolio front page.
- Keep each lab write-up consistent: objective, tools, steps, evidence, findings, conclusion, skills demonstrated.
- Store screenshots by lab number once the image links are safely migrated.
- Avoid vague labels like `image1.png` where possible.
- Use consistent lab numbering: `lab-01`, `lab-02`, `lab-03`.
- Do not delete screenshot evidence unless the relevant write-up has already been updated.
