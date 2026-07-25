provider "azurerm" {
  features {}

  subscription_id = "c0167ac3-7c0b-41f6-97d9-daaf92d58adb"

  # Prevent Terraform from trying to register Azure Resource Providers
  resource_provider_registrations = "none"
}