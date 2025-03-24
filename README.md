# azure-hardening
# Azure Hardening

**Purpose:** Provide guidelines and automation for securing Azure cloud resources. This repository is aimed at cloud architects and system administrators who want to enforce security best practices in a Microsoft Azure environment for small to mid-size businesses.

**Technologies & Tools:** Azure PowerShell (Az module), Azure CLI, Azure Policy, Azure Security Center.

**Use Cases:**
- Ensure all Azure Storage Accounts require secure transfer (HTTPS) only.
- Enforce encryption at rest and in transit for Azure services.
- Apply network security rules and NSGs consistently across subscriptions.
- Audit Azure resources for compliance with security benchmarks.

## Examples

- **Storage Account HTTPS Enforcement:** The PowerShell script [`Enforce-StorageHttps.ps1`](scripts/Enforce-StorageHttps.ps1) in the `scripts/` directory iterates through all storage accounts in a subscription and enables the `EnableHttpsTrafficOnly` flag on each. This ensures no unencrypted HTTP access is allowed.
- **Azure Policy Deployment:** Example JSON policies in the `configs/` folder illustrate how to require resource configurations (e.g., requiring VM disk encryption). *(Note: For brevity, refer to the actual policy files in the repository.)*

## Usage

To run the storage hardening script:
```powershell
# Connect to Azure (if not already authenticated)
Connect-AzAccount

# Run the HTTPS enforcement script for all storage accounts in a subscription
.\scripts\Enforce-StorageHttps.ps1 -SubscriptionId "<your-subscription-id>"
```

Customize and extend the provided templates and scripts for your environment as needed. For instance, adjust Azure Policy definitions in `configs/` to match your organization's security requirements.

