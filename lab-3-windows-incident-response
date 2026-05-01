# Lab 3: Windows Incident Response Case Study

## 📌 Overview

This case study documents a real-world Windows incident response investigation involving malware detection, persistence analysis, containment, and post-removal validation.

A structured approach was used to identify a malicious process, analyse its behaviour, remove persistence mechanisms, and verify full system remediation.

---

## 🧠 Executive Summary

A suspicious process (`zac_8264`) was identified in Windows Task Manager. Investigation revealed a malicious executable, **Pinellas.exe**, located in:

```
C:\Program Files (x86)\Mordant\
```

The malware maintained persistence via scheduled tasks and respawned after termination attempts.

A full containment process was executed to:

* Remove the malicious executable
* Eliminate persistence mechanisms
* Validate system integrity post-removal

---

## 🚨 Initial Detection

### Indicators of Compromise (IOCs)

* Unknown process: `zac_8264`
* Malicious executable: `Pinellas.exe`
* Suspicious `.config` file alongside executable
* Process respawning after termination

---

## 🛠 Tools Used

* Task Manager (Details tab)
* Task Scheduler
* Windows Registry Editor
* File Explorer
* System reboot validation

---

## 🔍 Investigation Process

### 1. Process Identification

* Identified suspicious process in Task Manager
* Used **"Open file location"** to trace executable
* Confirmed abnormal directory within Program Files

---

### 2. Persistence Analysis

Persistence was identified through:

* Scheduled tasks configured to relaunch the executable
* Process reappearing after termination and reboot
* Supporting configuration file enabling execution

---

### 3. Artifact Analysis

Key artifacts discovered:

* `Pinellas.exe`
* `Pinellas.exe.config`
* Scheduled task entries
* Temporary files located in `%temp%`

---

## 🧹 Containment & Eradication

The following actions were performed in sequence:

1. Terminated malicious processes
2. Identified and confirmed executable path
3. Deleted:

   * `Pinellas.exe`
   * `Pinellas.exe.config`
4. Removed associated scheduled tasks
5. Cleared temporary artifacts
6. Rebooted system
7. Re-verified system state

⚠️ Initial removal attempt failed due to persistence mechanisms, leading to reinfection.
Final remediation required removing persistence before deleting the executable.

---

## ✅ Post-Incident Validation

After final reboot:

* No malicious processes running
* No unknown scheduled tasks
* No suspicious startup entries
* No abnormal background services
* System operating normally

---

## 📊 Technical Summary

| Component    | Finding                                  |
| ------------ | ---------------------------------------- |
| Execution    | Scheduled task triggered executable      |
| Persistence  | Windows Scheduled Task                   |
| Artifacts    | Config file and temporary files          |
| Containment  | Manual removal + persistence elimination |
| Verification | Reboot validation and process monitoring |

---

## 🎯 Key Lessons Learned

* Always identify execution and persistence paths before deletion
* Removing persistence is critical to prevent reinfection
* Scheduled tasks are a common persistence mechanism
* Post-removal validation is essential
* A structured approach improves containment success

---

## 💼 Skills Demonstrated

* Windows process analysis
* Malware persistence identification
* Scheduled task investigation
* Manual containment and eradication
* Artifact validation
* Incident response methodology

---

## 📎 Notes

This investigation was conducted on a live system without prior forensic imaging.

Due to active containment and system reboots, full artifact preservation was not possible.
Documentation reflects real-time investigative actions and validated outcomes.
