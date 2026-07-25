terraform {
  backend "azurerm" {
    resource_group_name  = "first_rg"
    storage_account_name = "helloaitfstate001"
    container_name       = "tfstate"
    key                  = "hello-ai-dev.tfstate"
  }
}