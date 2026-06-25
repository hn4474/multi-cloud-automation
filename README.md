# Production Multi-Cloud GitOps Pipeline & Policy-As-Code Engine

[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-Enterprise_CI%2FCD-2088FF?logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![Terraform](https://img.shields.io/badge/Terraform-1.15.7-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Open Policy Agent](https://img.shields.io/badge/OPA-Rego_Compliance-18E6B1?logo=open-policy-agent&logoColor=white)](https://www.openpolicyagent.org/)
[![AWS](https://img.shields.io/badge/AWS-Infrastructure_as_Code-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

An enterprise-grade, zero-trust GitOps CI/CD pipeline engineered to solve a critical market gap: **preemptive cloud security**. Instead of traditional post-deployment reactive auditing, this framework shifts security completely to the left by evaluating infrastructure blueprints against strict compliance guardrails using an embedded Open Policy Agent (OPA) engine *before* a single cloud resource is ever provisioned.

---

## 🚀 Key Architectural Breakthroughs
*   **Automated Policy-as-Code (PaC) Gatekeeper:** Decouples corporate compliance rules from cloud-specific tooling using unified `rego` policy files.
*   **Strict Security Isolation:** Automatically drops and blocks non-compliant infrastructure blueprints mid-pipeline to prevent configuration drift and perimeter leaks.
*   **Hardened IAM Authentication:** Configured using secure execution scopes to restrict runner privileges, enforcing true zero-trust infrastructure automation.

---

## 📐 Pipeline Architecture Flow
