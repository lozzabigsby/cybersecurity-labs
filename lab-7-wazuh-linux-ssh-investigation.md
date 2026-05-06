# Lab 7: Wazuh Linux SSH Investigation and Troubleshooting

## Objective

The objective of this lab was to continue building a Wazuh-based SOC lab by working with a Linux victim machine and investigating SSH connectivity, Wazuh API access, dashboard availability, and agent communication issues.

This lab focused on the early investigation and troubleshooting phase rather than a fully completed attack simulation.

The purpose was to understand how the Wazuh manager, dashboard, API, and Linux victim environment interact during a basic SOC lab setup.

---

## Tools Used

- Wazuh
- Wazuh Dashboard
- Wazuh API
- Ubuntu Linux victim machine
- VMware Workstation Pro
- SSH
- PowerShell
- Linux terminal
- Local lab network

---

## Lab Summary

In this lab, I worked on a Wazuh SOC lab environment involving a Linux victim machine.

The work included checking Wazuh API access, confirming service responses, connecting between systems, and troubleshooting why the Wazuh dashboard and SSH sessions were not behaving consistently.

During the session, the Wazuh API returned a successful response showing that the API was reachable and running. However, the dashboard later stopped loading, and an SSH session was disconnected with a connection reset message.

This showed that the environment was partly working but still required troubleshooting before continuing with the full SSH brute-force detection scenario.

---

## Investigation Steps

1. Accessed the Wazuh server terminal.
2. Queried the Wazuh API locally using `curl`.
3. Confirmed that the Wazuh API responded successfully.
4. Verified that the Wazuh API was running and returning version information.
5. Continued working with the Linux victim environment.
6. Identified the Linux victim IP address as `192.168.11.131`.
7. Attempted to continue the lab from PowerShell.
8. Observed that the Wazuh dashboard stopped loading.
9. Noted an SSH disconnection message showing the connection was reset by `192.168.11.130`.
10. Paused the lab after identifying instability in the lab environment.

---

## Evidence Observed

### Wazuh API Response

The Wazuh API returned a valid response when queried locally from the Wazuh server.

The response showed:

- API title: `Wazuh API REST`
- API version: `4.14.5`
- API revision: `rc1`
- Licence: `GPL 2.0`

This confirmed that the Wazuh API itself was running and reachable locally.

### Linux Victim IP Address

The Linux victim machine being used during the lab was identified as:

```text
192.168.11.131
```

### Connection Reset Issue

During the session, the SSH connection was interrupted with a connection reset message from:

```text
192.168.11.130
```

This suggested a network, service, VM, or SSH session stability issue that needed to be investigated before continuing.

---

## Commands Used

### Query Wazuh API

```bash
curl -sk -H "Authorization: Bearer $TOKEN" https://127.0.0.1:55000/
```

This command was used to check whether the Wazuh API was responding locally on the Wazuh server.

---

## Findings

The Wazuh API was reachable locally and returned valid version information.

The Linux victim machine was available on the lab network, but the environment was not stable enough to complete the planned SSH brute-force detection scenario.

The Wazuh dashboard stopped loading during the session, and the SSH connection was reset.

This meant the next step was not to force the attack simulation, but to troubleshoot the lab environment first.

---

## Troubleshooting Notes

The following areas should be checked before continuing:

- Confirm Wazuh manager services are running
- Confirm Wazuh dashboard service is running
- Confirm the Wazuh indexer is healthy
- Confirm the Linux victim VM is powered on and reachable
- Confirm SSH is installed and running on the Linux victim
- Confirm the Wazuh agent is installed and connected if required
- Check IP addresses have not changed after VM restart
- Check VMware network mode and subnet consistency
- Review any firewall rules blocking SSH, dashboard, or agent communication

---

## Security Relevance

This lab is useful because SOC environments depend on several connected services working correctly.

A detection lab is not just about generating an attack. The environment must first be stable enough to collect logs, send telemetry, and display alerts.

Troubleshooting is an important security skill because analysts often need to work out whether a missing alert is caused by:

- The attack not happening
- The agent not sending logs
- The dashboard not displaying data
- A network issue
- A service failure
- A firewall or configuration issue

Understanding this helps avoid false assumptions during real investigations.

---

## Next Steps

The next stage of this lab will be to complete the SSH brute-force detection scenario.

Planned next steps:

1. Restart and verify the Wazuh services.
2. Confirm the dashboard loads successfully.
3. Confirm the Linux victim is reachable from the attacker machine.
4. Confirm SSH is running on the Linux victim.
5. Generate controlled failed SSH login attempts.
6. Review authentication logs on the Linux victim.
7. Confirm the activity appears in Wazuh.
8. Capture screenshots as evidence.
9. Write the completed SSH brute-force investigation findings.

---

## Analyst Notes

This lab did not fully complete the planned SSH brute-force detection scenario, but it captured an important part of the process: environment troubleshooting.

The main lesson was that when a security lab stops working, the correct response is to verify the stack layer by layer rather than assuming the whole lab has failed.

The Wazuh API response proved that part of the Wazuh stack was working. The dashboard and SSH disconnection issues showed that more troubleshooting was needed before moving on.

---

## Skills Demonstrated

- Wazuh API checking
- Linux victim lab setup
- SSH troubleshooting
- Dashboard troubleshooting
- Basic network investigation
- Service availability checking
- SOC lab environment troubleshooting
- Evidence-based problem solving
