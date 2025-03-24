Param(
    [string]$SubscriptionId
)
# Enforce HTTPS-only on all Azure Storage Accounts in the given subscription.
# Usage: .\Enforce-StorageHttps.ps1 -SubscriptionId "<your-subscription-id>"

if ($SubscriptionId) {
    try {
        Select-AzSubscription -SubscriptionId $SubscriptionId -ErrorAction Stop
    } catch {
        Write-Error "Failed to select subscription $SubscriptionId. Please login (Connect-AzAccount) and check the ID."
        exit 1
    }
}

$storageAccounts = Get-AzStorageAccount
foreach ($acct in $storageAccounts) {
    if (-not $acct.EnableHttpsTrafficOnly) {
        Write-Host "Enabling secure transfer for Storage Account '$($acct.StorageAccountName)'..."
        Set-AzStorageAccount -ResourceGroupName $acct.ResourceGroupName -Name $acct.StorageAccountName -EnableHttpsTrafficOnly $true
    }
    else {
        Write-Host "Storage Account '$($acct.StorageAccountName)' is already enforcing HTTPS."
    }
}
Write-Host "Storage account HTTPS enforcement complete."
