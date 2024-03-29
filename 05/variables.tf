provider "azurerm" {
    subscription_id = "${var.subscription_id}"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
}




variable "subscription_id" {
    description="Enter Subscription ID for Provisioning Resources in Azure"  
}

variable "client_id" {
  description = "Enter Client ID for Application Created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client Secret for Application  in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Direcotry ID of your Azure AD. Run Get-AzureSubscription"
}


