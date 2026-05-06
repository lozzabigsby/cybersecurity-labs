# Reorganise cybersecurity-labs screenshots into lab folders
# Run from the repository root after cloning the repo locally.

$ErrorActionPreference = "Stop"

function Move-LabImage {
    param(
        [string]$Source,
        [string]$Destination
    )

    if (Test-Path $Source) {
        $DestinationFolder = Split-Path $Destination -Parent
        if (!(Test-Path $DestinationFolder)) {
            New-Item -ItemType Directory -Path $DestinationFolder -Force | Out-Null
        }

        git mv $Source $Destination
        Write-Host "Moved $Source -> $Destination"
    }
    else {
        Write-Host "Skipped missing file: $Source"
    }
}

# Lab 5 screenshots
Move-LabImage "nmap-scan-1.png" "labs/lab-05-windows-firewall-nmap-detection/screenshots/01-nmap-scan.png"
Move-LabImage "nmap-scan-2.png" "labs/lab-05-windows-firewall-nmap-detection/screenshots/02-nmap-scan.png"
Move-LabImage "nmap-scan-3.png" "labs/lab-05-windows-firewall-nmap-detection/screenshots/03-nmap-scan.png"
Move-LabImage "nmap-scan-4.png" "labs/lab-05-windows-firewall-nmap-detection/screenshots/04-nmap-scan.png"
Move-LabImage "firewall-logging-enabled.png" "labs/lab-05-windows-firewall-nmap-detection/screenshots/05-firewall-logging-enabled.png"
Move-LabImage "logfile-detection.png" "labs/lab-05-windows-firewall-nmap-detection/screenshots/06-firewall-log-detection.png"

# Lab 6 screenshots
Move-LabImage "02-wazuh-dashboard.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/01-wazuh-dashboard.png"
Move-LabImage "03-windows-agent-service-started.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/02-windows-agent-service-started.png"
Move-LabImage "04-sysmon-installed.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/03-sysmon-installed.png"
Move-LabImage "05-wazuh-service-running-after-sysmon-config.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/04-wazuh-service-running-after-sysmon-config.png"
Move-LabImage "06-threat-hunting-win-victim-alerts.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/05-threat-hunting-windows-alerts.png"
Move-LabImage "07-sysmon-search-win-victim.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/06-sysmon-search-results.png"
Move-LabImage "08-win-victim-powershell-alerts-in-wazuh.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/07-powershell-alerts-in-wazuh.png"
Move-LabImage "09-expanded-sysmon-rule-92201-details.png" "labs/lab-06-wazuh-powershell-investigation/screenshots/08-expanded-sysmon-rule-92201-details.png"

# Lab 7 screenshots
Move-LabImage "01-victim-ssh-active.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/01-victim-ssh-active.png"
Move-LabImage "02-kali-ping-victim.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/02-kali-ping-victim.png"
Move-LabImage "03-ssh-port-open.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/03-ssh-port-open.png"
Move-LabImage "04-password-list.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/04-password-list.png"
Move-LabImage "05-hydra-ssh-bruteforce-attempt.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/05-hydra-ssh-bruteforce-attempt.png"
Move-LabImage "06-single-failed-ssh-login.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/06-single-failed-ssh-login.png"
Move-LabImage "07-wazuh-ubuntu-agent-active.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/07-wazuh-ubuntu-agent-active.png"
Move-LabImage "08-victim-ssh-auth-log-fakeuser.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/08-victim-ssh-auth-log-fakeuser.png"
Move-LabImage "09-wazuh-disk-expanded-62gb.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/09-wazuh-disk-expanded.png"
Move-LabImage "10-wazuh-ssh-authentication-failure-alert.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/10-wazuh-ssh-authentication-failure-alert.png"
Move-LabImage "11-wazuh-alert-details-source-ip.png" "labs/lab-07-wazuh-ssh-bruteforce-detection/screenshots/11-wazuh-alert-details-source-ip.png"

Write-Host "Image reorganisation complete. Now update markdown links, review with git status, then commit."
