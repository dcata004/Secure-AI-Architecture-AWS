# Secure-AI-Architecture-AWS
The "NIST-Compliant AI Private Perimeter"This architecture ensures that an AI model (Amazon SageMaker) is locked inside a Private VPC (Virtual Private Cloud). No data leaks to the public internet.
# 🏗️ Secure AI Cloud Architecture (AWS / NIST-Aligned)
**Designed by an AI Governance & Risk Architect**

### 📊 Project Overview
This project provides the **Infrastructure as Code (IaC)** blueprints for a secure, private AI environment. It is designed to host Large Language Models (LLMs) within a financial service context (SEC/FINRA compliant).

### 🛡️ Security Guardrails Included:
* **Network Isolation:** SageMaker instances have `direct_internet_access` DISABLED to prevent data exfiltration.
* **Encrypted Perimeter:** All traffic is locked to Port 443 within a private VPC.
* **Governance Tagging:** Resources are mapped to the **NIST AI Risk Management Framework** for automated auditing.

### 💼 Fiduciary Context
As a **Series 7 & 2-15 licensed professional**, I designed this architecture to solve the "Trust Problem" in banking AI. This ensures that sensitive client PII never leaves the controlled firm environment.
