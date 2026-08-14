# Lab 11 - Active Directory Security Monitoring and Wazuh Detection Engineering

## Overview

This lab documents the design, deployment, hardening, and monitoring of a small Windows Active Directory environment integrated with Wazuh and Sysmon.

The goal was to build a realistic internal domain, apply identity and access controls, enable detailed Windows auditing, centralise endpoint telemetry in Wazuh, and validate several attack and detection scenarios.

The completed workflow covered:

```text
Isolated VMware network
Windows Server domain controller
Domain-joined workstation and admin workstation
Users, groups, service accounts, SMB shares, and Group Policy
Advanced Windows auditing and Sysmon telemetry
Wazuh agent collection and alerting
Kali-generated test activity
Custom Wazuh detection rules
```

---

## Executive Summary

This project built a five-system security lab around the `reflect.test` Active Directory domain and proved that identity, endpoint, and file-share activity could be centrally detected and investigated.

Three Windows systems were joined to the domain and monitored by Wazuh. Native Windows Security auditing and Sysmon telemetry were collected by an Ubuntu-based Wazuh server. Controlled activity from Windows and Kali then validated detections for failed authentication, unauthorised Finance-share access, encoded PowerShell, scheduled-task persistence, privileged-group modification, and SMB object access.

### Portfolio Highlights

| Measure | Result |
|---|---|
| Systems in the isolated lab | 5 |
| Domain-joined Windows systems | 3 |
| Active Wazuh Windows agents | 3 |
| Endpoint telemetry sources | Windows Security and Sysmon |
| Custom Wazuh detections validated | 2 |
| Additional built-in detections investigated | 3 |
| Evidence screenshots | 45 |
| MITRE ATT&CK techniques evidenced | 4 |

The project demonstrates the ability to build the environment, configure the controls, generate controlled security activity, validate alerts, interpret event fields, and communicate the results as a repeatable SOC investigation.

---

## Architecture

```mermaid
flowchart LR
    Kali["Kali Linux<br/>Controlled testing"]
    Net["VMnet2 isolated network<br/>10.20.30.0/24"]
    DC["DC01<br/>AD DS, DNS, SMB and audit logs<br/>10.20.30.10"]
    WS["WS01<br/>Domain workstation<br/>10.20.30.101"]
    ADM["ADM01<br/>Administrative workstation<br/>10.20.30.102"]
    Wazuh["Ubuntu Wazuh Server<br/>Manager, indexer and dashboard<br/>10.20.30.20"]

    Kali --> Net
    DC --> Net
    WS --> Net
    ADM --> Net
    Wazuh --> Net
    DC -->|"AD DS, DNS and Group Policy"| WS
    DC -->|"AD DS, DNS and Group Policy"| ADM
    WS -->|"Security and Sysmon events"| Wazuh
    ADM -->|"Security and Sysmon events"| Wazuh
    DC -->|"Security and Sysmon events"| Wazuh
    Kali -->|"SMB and authentication tests"| DC
```

### Detection Data Flow

```text
Controlled activity
        ↓
Windows Security or Sysmon event
        ↓
Wazuh agent on DC01, WS01, or ADM01
        ↓
Ubuntu Wazuh manager and indexer
        ↓
Built-in or custom Wazuh rule
        ↓
Dashboard alert and analyst validation
```

---

## Lab Objective

The objective was to create a monitored Active Directory lab that could support both defensive administration and controlled security testing.

The lab was designed to demonstrate the full security-monitoring chain:

1. Build and validate the Windows domain environment.
2. Implement role-based access and administrative separation.
3. Introduce controlled security weaknesses for testing.
4. Enable Windows Security and Sysmon telemetry.
5. Forward endpoint events to Wazuh.
6. Generate suspicious activity from Windows and Kali systems.
7. Confirm built-in and custom Wazuh detections.

---

## Environment

| Component | Purpose | Lab Address |
|---|---|---:|
| DC01 | Windows Server domain controller, DNS, file shares, and audit source | `10.20.30.10` |
| WS01 | Domain-joined Windows workstation and detection target | `10.20.30.101` |
| ADM01 | Domain-joined administrative workstation | `10.20.30.102` |
| Wazuh Server | Ubuntu Linux host running the Wazuh manager, indexer, and dashboard | `10.20.30.20` |
| Kali Linux | Controlled attack and validation system | VMnet2 lab network |
| VMware Workstation | Virtualisation and isolated network platform | VMnet2 / `10.20.30.0/24` |

### Domain Details

| Field | Value |
|---|---|
| Active Directory domain | `reflect.test` |
| NetBIOS name | `REFLECT` |
| Domain controller | `DC01.reflect.test` |
| Workstation | `WS01.reflect.test` |
| Administrative workstation | `ADM01.reflect.test` |

---

## Tools Used

- Windows Server and Active Directory Domain Services
- Active Directory Users and Computers
- Group Policy Management
- Windows PowerShell
- Windows Advanced Audit Policy
- Windows Security Event Log
- Sysmon
- Ubuntu Linux
- Wazuh Manager 4.14.5
- Wazuh agents
- Wazuh Dashboard
- Kali Linux
- VMware Workstation
- SMB file sharing

---

## Methodology and Evidence

## Phase 1 - Network and Domain Deployment

### 1. Configured a static address on DC01

DC01 was assigned the static address `10.20.30.10/24`. A fixed address was required because the server would provide domain and DNS services to the other Windows systems.

![DC01 static IP configuration](labs/lab-11-active-directory-wazuh-detection/screenshots/03-dc01-static-ip-configuration.png)

### 2. Validated bidirectional connectivity between WS01 and DC01

Connectivity was tested in both directions to confirm that the workstation and domain controller could communicate across the isolated lab network.

![WS01 to DC01 connectivity](labs/lab-11-active-directory-wazuh-detection/screenshots/04-ws01-to-dc01-connectivity.png)

![DC01 to WS01 connectivity](labs/lab-11-active-directory-wazuh-detection/screenshots/05-dc01-to-ws01-connectivity.png)

### 3. Configured ADM01 and validated domain-controller connectivity

ADM01 was assigned `10.20.30.102` and tested against DC01. Reverse connectivity from DC01 to ADM01 was also confirmed.

![ADM01 static IP and DC01 connectivity](labs/lab-11-active-directory-wazuh-detection/screenshots/06-adm01-static-ip-and-dc01-connectivity.png)

![DC01 to ADM01 connectivity](labs/lab-11-active-directory-wazuh-detection/screenshots/07-dc01-to-adm01-connectivity.png)

### 4. Installed Active Directory Domain Services

The AD DS server role and its management tools were installed successfully on DC01.

![AD DS role installed](labs/lab-11-active-directory-wazuh-detection/screenshots/08-ad-ds-role-installed.png)

### 5. Created and verified the `reflect.test` domain

DC01 was promoted to a domain controller for the new `reflect.test` forest. PowerShell checks confirmed the domain, NetBIOS name, domain controller address, DNS resolution, and current user domain.

![Reflect domain created and verified](labs/lab-11-active-directory-wazuh-detection/screenshots/11-reflect-domain-created-and-verified.png)

### 6. Joined WS01 and ADM01 to the domain

Both Windows endpoints were joined to `reflect.test`. The system information confirmed that each computer was a domain member.

![WS01 joined to Reflect domain](labs/lab-11-active-directory-wazuh-detection/screenshots/12-ws01-joined-to-reflect-domain.png)

![ADM01 joined to Reflect domain](labs/lab-11-active-directory-wazuh-detection/screenshots/13-adm01-joined-to-reflect-domain.png)

---

## Phase 2 - Identity, Access, and File-Share Configuration

### 7. Built the Active Directory organisational-unit structure

Organisational units were created to separate computers, users, privileged accounts, service accounts, and departmental identities. This structure supported cleaner administration and targeted Group Policy application.

![Active Directory organisational units](labs/lab-11-active-directory-wazuh-detection/screenshots/14-active-directory-organisational-units.png)

### 8. Assigned James Hall to the Sales security group

The user account for James Hall was added to the Sales group, demonstrating role-based access through group membership rather than direct per-user permissions.

![James Hall Sales group membership](labs/lab-11-active-directory-wazuh-detection/screenshots/15-james-hall-sales-group-membership.png)

### 9. Verified departmental security-group memberships

PowerShell was used to enumerate the Sales, Finance, and IT group memberships and confirm that departmental accounts had been assigned correctly.

![Department security group memberships](labs/lab-11-active-directory-wazuh-detection/screenshots/16-department-security-group-memberships.png)

### 10. Created privileged and service accounts

Separate administrative and backup service accounts were created in dedicated organisational units. This demonstrated account separation and provided identities for later monitoring scenarios.

![Privileged and service accounts](labs/lab-11-active-directory-wazuh-detection/screenshots/17-privileged-and-service-accounts2.png)

### 11. Created departmental SMB shares

Departmental file shares were created on DC01 and their access-control configuration was reviewed.

![Reflect SMB shares created](labs/lab-11-active-directory-wazuh-detection/screenshots/18-reflect-smb-shares-created.png)

### 12. Introduced a controlled Finance-share misconfiguration

James Hall was deliberately granted read access to the Finance share. This intentional weakness created a realistic access-control test case for later auditing and detection.

![Finance share intentional misconfiguration](labs/lab-11-active-directory-wazuh-detection/screenshots/19-finance-share-intentional-misconfiguration.png)

### 13. Tested unauthorised Finance access

James Hall could read the test Finance document but was denied permission when attempting to modify it. This confirmed the controlled exposure and produced activity suitable for Windows auditing.

![James Hall unauthorised Finance access](labs/lab-11-active-directory-wazuh-detection/screenshots/20-james-hall-unauthorized-finance-access.png)

---

## Phase 3 - Group Policy and Windows Auditing

### 14. Linked the workstation local-administrator policy

A Group Policy Object was linked to the workstation organisational units so the designated domain group could be applied consistently to the local Administrators group.

![Workstation local admin GPO links](labs/lab-11-active-directory-wazuh-detection/screenshots/21-workstation-local-admin-gpo-links.png)

### 15. Verified the policy on WS01 and ADM01

Local group membership and Group Policy results confirmed that `REFLECT\GG-Workstation-Admins` was present and that the policy applied successfully to both endpoints.

![WS01 workstation admin GPO applied](labs/lab-11-active-directory-wazuh-detection/screenshots/22-ws01-workstation-admin-gpo-applied.png)

![ADM01 workstation admin GPO applied](labs/lab-11-active-directory-wazuh-detection/screenshots/23-adm01-workstation-admin-gpo-applied.png)

### 16. Created the enhanced Windows logging policy

The `LAB11 - Enhanced Windows Logging` GPO enabled script-block logging, module logging, and process command-line capture to improve investigation visibility.

![Enhanced Windows logging GPO created](labs/lab-11-active-directory-wazuh-detection/screenshots/24-enhanced-windows-logging-gpo-created.png)

### 17. Enabled advanced audit policy on DC01

Advanced audit categories were enabled for logon, special logon, file-share access, process creation, account management, security-group management, directory-service changes, policy changes, and credential validation.

![DC01 advanced audit policy enabled](labs/lab-11-active-directory-wazuh-detection/screenshots/25-dc01-advanced-audit-policy-enabled.png)

### 18. Enabled auditing on the Finance folder

The Finance share received a file-system audit rule for the James Hall account, recording successful and failed access attempts.

![Finance folder auditing enabled](labs/lab-11-active-directory-wazuh-detection/screenshots/26-finance-folder-auditing-enabled.png)

### 19. Confirmed Finance-access Security events

Windows Security events showed activity against `Q3_Budget_Draft.txt`, including Event IDs `4663` and `5145`. This proved that object and network-share access were being captured.

![Finance access Security events](labs/lab-11-active-directory-wazuh-detection/screenshots/27-finance-access-security-events.png)

---

## Phase 4 - Wazuh and Sysmon Integration

### 20. Connected the Ubuntu Wazuh server to the isolated lab network

The Ubuntu Linux Wazuh server was configured with a second network interface on VMnet2 and successfully reached DC01 at `10.20.30.10`.

![Wazuh VMnet2 connectivity](labs/lab-11-active-directory-wazuh-detection/screenshots/28-wazuh-vmnet2-connectivity.png)

### 21. Confirmed the Wazuh network configuration persisted

After rebooting, Ubuntu retained the Wazuh server's `10.20.30.20/24` address and could still reach DC01. This confirmed that the Linux network configuration persisted correctly.

![Wazuh static VMnet2 address after reboot](labs/lab-11-active-directory-wazuh-detection/screenshots/29-wazuh-static-vmnet2-after-reboot.png)

### 22. Verified Wazuh services, ports, and version

The Wazuh manager, indexer, dashboard, and supporting ports were checked from the Ubuntu terminal. The manager reported version `4.14.5`.

![Wazuh services and ports running](labs/lab-11-active-directory-wazuh-detection/screenshots/30-wazuh-services-and-ports-running.png)

![Wazuh manager version 4.14.5](labs/lab-11-active-directory-wazuh-detection/screenshots/31-wazuh-manager-version-4-14-5.png)

### 23. Registered DC01 with Wazuh

The Wazuh agent list confirmed that DC01 was active and communicating with the manager.

![DC01 Wazuh agent active](labs/lab-11-active-directory-wazuh-detection/screenshots/33-dc01-wazuh-agent-active.png)

### 24. Configured DC01 Security-log collection

The DC01 Wazuh agent was configured to collect the Windows Security channel. Service status and network checks confirmed that the agent was running and could reach the manager.

![DC01 Security channel configured](labs/lab-11-active-directory-wazuh-detection/screenshots/34-dc01-security-channel-configured.png)

### 25. Confirmed failed-logon detection from DC01

A controlled failed sign-in generated a Wazuh alert from DC01. The dashboard event proved that Windows authentication telemetry was reaching the SIEM.

![Wazuh DC01 failed logon alert](labs/lab-11-active-directory-wazuh-detection/screenshots/35-wazuh-dc01-failed-logon-alert.png)

### 26. Registered WS01 and ADM01 with Wazuh

The Wazuh manager showed both domain endpoints as active agents alongside DC01.

![WS01 Wazuh agent active](labs/lab-11-active-directory-wazuh-detection/screenshots/36-ws01-wazuh-agent-active.png)

![ADM01 Wazuh agent active](labs/lab-11-active-directory-wazuh-detection/screenshots/37-adm01-wazuh-agent-active.png)

### 27. Installed and verified Sysmon on DC01

Sysmon was installed and running on the domain controller. A recent event confirmed that endpoint process telemetry was being produced.

![Sysmon installed and verified on DC01](labs/lab-11-active-directory-wazuh-detection/screenshots/38-sysmon-installed-and-verified-on-dc01.png)

### 28. Configured DC01 Sysmon collection in Wazuh

The DC01 agent was configured to collect the `Microsoft-Windows-Sysmon/Operational` channel and could reach the Wazuh manager on port `1514`.

![DC01 Wazuh Sysmon channel configured](labs/lab-11-active-directory-wazuh-detection/screenshots/39-dc01-wazuh-sysmon-channel-configured.png)

### 29. Confirmed DC01 Sysmon process events in Wazuh

Wazuh displayed detailed Sysmon process-creation telemetry from DC01, proving the endpoint-to-SIEM data path.

![Wazuh DC01 Sysmon process event](labs/lab-11-active-directory-wazuh-detection/screenshots/40-wazuh-dc01-sysmon-process-event.png)

### 30. Installed and verified Sysmon on WS01

The Sysmon service and recent operational events were confirmed on the workstation.

![Sysmon installed and verified on WS01](labs/lab-11-active-directory-wazuh-detection/screenshots/41-sysmon-installed-and-verified-on-ws01.png)

### 31. Configured WS01 Sysmon collection in Wazuh

The WS01 agent was running, the Sysmon channel was configured, and the Wazuh manager was reachable on port `1514`.

![WS01 Wazuh Sysmon channel configured](labs/lab-11-active-directory-wazuh-detection/screenshots/42-ws01-wazuh-sysmon-channel-configured.png)

### 32. Confirmed Sysmon activity from WS01 and ADM01

The Wazuh Dashboard showed process and discovery events associated with both agents, confirming multi-endpoint visibility.

![WS01 and ADM01 Sysmon events in Wazuh](labs/lab-11-active-directory-wazuh-detection/screenshots/43-ws01-and-adm01-sysmon-events-in-wazuh.png)

---

## Phase 5 - Attack Simulation and Detection Validation

### 33. Validated Kali connectivity

Kali Linux successfully reached both DC01 and the Wazuh server across the isolated lab network.

![Kali VMnet2 connectivity](labs/lab-11-active-directory-wazuh-detection/screenshots/44-kali-vmnet2-connectivity.png)

### 34. Detected an SMB failed-logon attempt from Kali

A controlled SMB authentication failure generated Windows security telemetry that was ingested and displayed in Wazuh.

![Kali SMB failed logon detected](labs/lab-11-active-directory-wazuh-detection/screenshots/45-kali-smb-failed-logon-detected.png)

### 35. Validated a custom Finance-share access detection

A custom Wazuh rule detected access to the monitored Finance share. This converted raw Windows share-access telemetry into a higher-value, scenario-specific alert.

![Custom Finance share access detection](labs/lab-11-active-directory-wazuh-detection/screenshots/46-custom-finance-share-access-detection.png)

### 36. Detected encoded PowerShell on WS01

A controlled encoded PowerShell command was executed on WS01. Wazuh detected the suspicious command-line behaviour using the enhanced Windows and Sysmon telemetry.

![Encoded PowerShell detected on WS01](labs/lab-11-active-directory-wazuh-detection/screenshots/47-encoded-powershell-detected-on-ws01.png)

### 37. Detected scheduled-task persistence

A custom detection identified scheduled-task creation used to simulate persistence. This demonstrated monitoring for a common Windows persistence technique.

![Custom scheduled task persistence detection](labs/lab-11-active-directory-wazuh-detection/screenshots/48-custom-scheduled-task-persistence-detection.png)

### 38. Detected a privileged-group membership change

Wazuh detected a change to privileged group membership and exposed the affected user and group information for investigation.

![Privileged group membership change detected](labs/lab-11-active-directory-wazuh-detection/screenshots/49-privileged-group-membership-change-detected.png)

### 39. Investigated Event ID 5145 in Wazuh

The Wazuh event view showed detailed network-share access telemetry for Event ID `5145`, including the account, share, object, access mask, and originating endpoint information.

![Event ID 5145 in Wazuh](labs/lab-11-active-directory-wazuh-detection/screenshots/50-eventID5145_wazuh.png)

---

## Detection Engineering Detail

The alert review went beyond confirming that an event appeared in the dashboard. The source agent, event channel, Windows or Sysmon Event ID, user, process, command line, target object, source address, Wazuh rule, severity, and MITRE mapping were checked where available.

### Validated Rule Coverage

| Scenario | Telemetry and match context | Wazuh rule | Level | Outcome |
|---|---|---:|---:|---|
| Unauthorised Finance-share access | Windows Security Event ID `5145`; user `james.hall`; Finance share; `Q3_Budget_Draft.txt`; source `10.20.30.200` | `100101` | 10 | Custom alert fired on DC01 |
| Encoded PowerShell | Sysmon Event ID `1`; `powershell.exe`; encoded command line; WS01 | `92057` | 12 | Built-in high-severity alert fired |
| Scheduled-task persistence | Sysmon Event ID `1`; `schtasks.exe /Create`; task `LAB11-Persistence-Test`; WS01 | `100102` | 10 | Custom persistence alert fired |
| Privileged-group membership change | Windows Security Event ID `4728`; James Hall added to `GG-Workstation-Admins`; DC01 | `60141` | 5 | Membership change recorded in Wazuh |
| Network-share object access | Windows Security Event ID `5145`; share path, account, access list, and source address | Windows event-channel rule | Varies | Share access searchable and attributable |

### Custom Detection Specifications

#### Rule 100101 - Unauthorised Finance-share access

| Field | Validated value |
|---|---|
| Data source | Windows Security log |
| Windows Event ID | `5145` |
| Agent | `DC01` / agent ID `003` |
| User | `REFLECT\james.hall` |
| Target share | `Finance$` |
| Target object | `Q3_Budget_Draft.txt` |
| Source address | `10.20.30.200` |
| Wazuh level | 10 |
| MITRE ATT&CK | `T1039` - Data from Network Shared Drive |

This rule turns a high-volume share-access event into a specific alert by adding business context: a Sales user accessed a Finance resource.

#### Rule 100102 - Scheduled-task persistence

| Field | Validated value |
|---|---|
| Data source | Sysmon Operational log |
| Sysmon Event ID | `1` - Process Create |
| Agent | `WS01` / agent ID `004` |
| Process | `schtasks.exe` |
| Command-line indicator | `/Create` |
| Test task | `LAB11-Persistence-Test` |
| Execution context | `SYSTEM` at logon |
| Wazuh level | 10 |
| MITRE ATT&CK | `T1053.005` - Scheduled Task/Job: Scheduled Task |

This rule identifies command-line creation of a scheduled task and preserves the full process context required for triage.

---

## MITRE ATT&CK Mapping

| Behaviour | Technique | Tactic | Evidence |
|---|---|---|---|
| Encoded PowerShell execution | `T1059.001` - PowerShell | Execution | Sysmon process creation and Wazuh rule `92057` |
| Scheduled-task creation | `T1053.005` - Scheduled Task | Execution, Persistence, Privilege Escalation | Custom Wazuh rule `100102` |
| Finance-share document access | `T1039` - Data from Network Shared Drive | Collection | Custom Wazuh rule `100101` |
| Privileged-group membership change | `T1098` - Account Manipulation | Persistence, Privilege Escalation | Windows Event ID `4728` and Wazuh rule `60141`; analyst mapping |

The first three mappings were present in the Wazuh alert evidence. The `T1098` mapping is an analyst-applied interpretation of the privileged-group change rather than a mapping displayed in the captured alert.

---

## Key Detection Evidence

| Detection or Control | Result |
|---|---|
| Domain and DNS validation | Confirmed |
| WS01 and ADM01 domain membership | Confirmed |
| Departmental group membership | Confirmed |
| Workstation local-admin GPO | Applied to WS01 and ADM01 |
| Advanced Windows auditing | Enabled |
| Finance folder access auditing | Enabled and generating events |
| DC01, WS01, and ADM01 Wazuh agents | Active |
| Windows Security channel ingestion | Confirmed |
| Sysmon ingestion from Windows endpoints | Confirmed |
| Failed Windows and SMB authentication | Detected |
| Finance-share access | Detected with custom rule |
| Encoded PowerShell execution | Detected |
| Scheduled-task persistence | Detected with custom rule |
| Privileged-group membership change | Detected |
| Event ID 5145 share access | Investigated in Wazuh |

---

## Security Findings

### Finding 1 - Finance-share access was broader than intended

James Hall, a Sales user, was deliberately granted read access to the Finance share. The test confirmed that he could read a Finance document even though modification was denied.

This demonstrated why access reviews must evaluate all effective permissions. Blocking write access does not remove the confidentiality risk created by unauthorised read access.

### Finding 2 - Native Windows auditing provided essential context

Advanced audit policy and folder-level auditing generated the Windows events needed to identify who accessed the Finance share, which object was targeted, and which access rights were requested.

### Finding 3 - Sysmon materially improved endpoint visibility

Windows Security logs recorded authentication, account, policy, and share activity. Sysmon added detailed process telemetry that supported PowerShell and persistence detections.

### Finding 4 - Centralised monitoring made multi-host investigation practical

With DC01, WS01, and ADM01 connected to Wazuh, activity from several systems could be reviewed through a single dashboard rather than investigated separately on each endpoint.

### Finding 5 - Custom rules increased the value of raw events

Native Event IDs provided the underlying evidence, while custom Wazuh rules elevated lab-specific behaviours such as Finance-share access and scheduled-task persistence into clearer security alerts.

---

## Recommended Hardening Actions

1. Remove the intentional James Hall access-control entry from the Finance share.
2. Review both SMB share permissions and NTFS permissions for departmental data.
3. Perform regular reviews of privileged and departmental group membership.
4. Use separate administrative accounts only from managed administrative workstations.
5. Apply least privilege to service accounts and deny interactive sign-in where appropriate.
6. Retain advanced audit policy, PowerShell logging, command-line logging, and Sysmon coverage.
7. Monitor Event IDs associated with failed logons, share access, group changes, process creation, and scheduled tasks.
8. Tune custom Wazuh rules to reduce false positives while preserving high-value context.
9. Protect the Wazuh manager and dashboard using restricted administration and secure network access.
10. Document and test an incident-response workflow for each high-priority detection.

---

## Remediation and Validation Plan

The Finance permission was intentionally left in place during the detection phase so the access scenario could be repeated. A production-style closure would use the following validation sequence:

1. Remove the direct `REFLECT\james.hall` access-control entry from the Finance share and underlying NTFS folder.
2. Confirm that Finance access is granted only through the approved Finance security group.
3. Refresh the user's sign-in token or start a new session.
4. Retest read and write access from the same source endpoint.
5. Confirm that access is denied and that Windows generates the expected failure audit event.
6. Confirm that Wazuh ingests the event and retains the user, source address, share, object, and access-mask context.
7. Record the before-and-after permission state as closure evidence.

This separates two outcomes that should not be confused: the detection control worked, but the underlying access weakness still requires remediation and verification.

---

## Investigation Playbooks

### Encoded PowerShell alert

1. Confirm the source agent, user, integrity level, parent process, and complete command line.
2. Decode the Base64 content in an isolated analysis environment.
3. Review adjacent Sysmon process, network, and file events.
4. Check whether the same command or hash appears on other endpoints.
5. Contain the endpoint if the activity is not an authorised test.

### Scheduled-task persistence alert

1. Record the task name, command, trigger, run-as account, and creating process.
2. Compare the task with the approved administrative baseline.
3. Review the parent PowerShell process and the initiating user session.
4. Disable and preserve the task if unauthorised.
5. Hunt for the same task name or command across the environment.

### Privileged-group change alert

1. Confirm the actor, added member, target group, domain controller, and timestamp.
2. Validate the change against an approved request.
3. Remove unauthorised membership and reset affected credentials if necessary.
4. Review subsequent privileged logons and administrative activity.
5. Search for related account-management events across all domain controllers.

---

## Scope and Limitations

- The environment is an isolated home lab using synthetic identities and test data.
- Attack activity was controlled and generated only to validate defensive visibility.
- The custom rules were validated against the captured scenarios; production deployment would require broader testing and false-positive tuning.
- The screenshots prove detection of the intentional Finance access, but post-remediation denial evidence was not captured in this phase.
- High availability, long-term retention, backup, and production-scale Wazuh performance were outside the scope of this exercise.

Documenting these limitations makes the evidence easier to assess and avoids overstating what the lab proves.

---

## Key Lessons Learned

- Correct network, DNS, time, and domain configuration are prerequisites for reliable security monitoring.
- Group-based permissions are easier to audit and maintain than direct user assignments.
- Share permissions and NTFS permissions must be assessed together because effective access depends on both.
- Native Windows logs provide identity and object context, while Sysmon adds the process detail needed for behavioural detection.
- Central collection is not enough by itself; useful detections require validated fields, meaningful severity, and business context.
- A successful alert proves visibility, not remediation. The underlying weakness must still be removed and retested.

---

## Analyst Notes

The strongest part of this lab was the connection between system administration and detection engineering.

The Active Directory environment created realistic identities, groups, systems, policies, and data-access paths. Windows auditing and Sysmon then exposed the activity generated inside that environment. Wazuh centralised the telemetry, while controlled tests from Windows and Kali validated that meaningful security behaviours could be detected.

This is an important SOC workflow: do not stop at proving that a log exists. Confirm the source host, user, target object, action, rule, and surrounding context, then connect the event to the security control or threat behaviour being tested.

---

## Skills Demonstrated

- Active Directory Domain Services deployment
- Windows domain and DNS validation
- Domain workstation administration
- Organisational-unit design
- User, group, privileged-account, and service-account management
- Role-based access control
- SMB share and NTFS permission testing
- Group Policy creation and validation
- Windows Advanced Audit Policy
- PowerShell and process command-line logging
- Windows Security event analysis
- Ubuntu Linux networking and service validation
- Wazuh manager and Windows agent deployment
- Sysmon installation and SIEM integration
- Multi-endpoint security monitoring
- Kali-based authentication testing
- Custom Wazuh rule validation
- Encoded PowerShell detection
- Scheduled-task persistence detection
- Privileged-group change monitoring
- Network-share access investigation
- Evidence collection and SOC-style documentation

---

## Conclusion

This lab successfully built and monitored a complete Active Directory security environment.

DC01, WS01, and ADM01 were configured on an isolated network and joined to the `reflect.test` domain. Organisational units, users, groups, privileged accounts, service accounts, SMB shares, and Group Policy controls were implemented and validated. Advanced Windows auditing and Sysmon provided detailed endpoint telemetry, while the Ubuntu-based Wazuh server centralised events from all three Windows systems.

Controlled testing confirmed detection of failed authentication, SMB activity, Finance-share access, encoded PowerShell, scheduled-task persistence, privileged-group changes, and Event ID `5145` network-share access.

The completed project demonstrates practical Active Directory administration, Windows security logging, endpoint telemetry, SIEM integration, attack simulation, detection engineering, and evidence-led investigation in one repeatable lab.
