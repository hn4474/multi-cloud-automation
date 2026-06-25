# Production Multi-Cloud GitOps Pipeline & Policy-As-Code Engine

[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-Enterprise_CI%2FCD-2088FF?logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![Terraform](https://img.shields.io/badge/Terraform-1.15.7-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Open Policy Agent](https://img.shields.io/badge/OPA-Rego_Compliance-18E6B1?logo=open-policy-agent&logoColor=white)](https://www.openpolicyagent.org/)
[![AWS](https://img.shields.io/badge/AWS-Infrastructure_as_Code-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

An enterprise-grade, zero-trust GitOps CI/CD pipeline engineered to solve a critical market gap: **preemptive cloud security**. Instead of traditional post-deployment reactive auditing, this framework shifts security completely to the left by evaluating infrastructure blueprints against strict compliance guardrails using an embedded Open Policy Agent (OPA) engine *before* a single cloud resource is ever provisioned.

---

## 🚀 Key Architectural Breakthroughs
* **Automated Policy-as-Code (PaC) Gatekeeper:** Decouples corporate compliance rules from cloud-specific tooling using unified `rego` policy files.
* **Strict Security Isolation:** Automatically drops and blocks non-compliant infrastructure blueprints mid-pipeline to prevent configuration drift and perimeter leaks.
* **Hardened IAM Authentication:** Configured using secure execution scopes to restrict runner privileges, enforcing true zero-trust infrastructure automation.

---

## 📐 Pipeline Architecture Flow

[ Git Push/PR ] ──> [ 1. Format & Linting ] ──> [ 2. AWS Authentication ] ──> [ 3. OPA Policy Engine Scan ] ──> [ 4. Safe Terraform Apply ]

1. **Format & Structural Analysis:** Automatic code quality gating via recursive syntax verification.
2. **Isolated AWS Login Hook:** Securely authenticates the runner using repository environment scopes.
3. **Compliance Guardrails Scan:** Compiles a high-fidelity JSON plan and matches it against `compliance.rego`. If a security flaw is detected, the engine freezes deployment and drops the runner state.
4. **Idempotent Execution:** Executes a safe, auto-approved deployment directly onto target AWS isolated virtual networks.

---

## 🛠️ Tech Stack & Tooling
* **Infrastructure as Code:** Terraform (v1.15.7) modular blueprints
* **CI/CD Orchestration:** GitHub Actions (Runner OS: Ubuntu Latest)
* **Policy Engine:** Open Policy Agent (OPA) parsing native Rego syntax
* **Target Cloud Provider:** Amazon Web Services (AWS Architecture)

---

## 📈 Enterprise Production Value

This pipeline framework is directly optimized to address real-world business and operational metrics:

| Operational Metric | Business Impact |
| :--- | :--- |
| **Shift-Left Security Compliance** | Eliminates manual cloud audits; catches vulnerabilities at the PR stage instead of post-deployment. |
| **Zero-Trust Delivery** | Isolates environment configurations completely to safeguard against data exposure and access token exploits. |
| **Automated Pipeline Engine** | Accelerates multi-tier provisioning stability, removing manual console overhead and reducing human error. |

---

## 📁 Repository Blueprint Structure

├── .github/workflows/
│   └── terraform-pipeline.yml   # Optimized enterprise CI/CD engine layout
├── environments/
│   └── production/              # Isolated production network blueprints (VPC, Subnets, Gateway)
├── modules/
│   └── aws/
│       └── networking/          # Reusable, parameterized infrastructure modules
└── policies/
    └── compliance.rego          # Policy-as-Code rules written in Rego syntax

---

## 🔍 Code Overview: The Compliance Gatekeeper

The core engine relies on a robust validation routine. Below is the active mechanism running inside the `.yml` workflow preventing deployment if infrastructure compromises organizational security posture:

      - name: Evaluate Compliance Policies
        run: |
          opa eval --data ../../policies/compliance.rego --input tfplan.json "data.main.deny" > compliance_result.json
          if grep -q "\[\"" compliance_result.json; then
            echo "🚨 COMPLIANCE BLOCK: Infrastructure plan breaks compliance mandates."
            cat compliance_result.json
            exit 1
          fi
          echo "✅ Compliance check passed successfully."

---
💡 *This repository showcases an automated production cloud platform design pattern. For inquiries regarding multi-cloud architecture, automated landing zones, or platform optimization engineering, contact via LinkedIn.*
