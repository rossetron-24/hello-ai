resource "azurerm_resource_group" "rg" {
  name     = "first_rg"
  location = "Sweden Central"
}

resource "azurerm_container_registry" "acr" {
  name                = "helloaiacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku           = "Basic"
  admin_enabled = false
}

resource "azurerm_log_analytics_workspace" "logs" {
  name                = "hello-ai-logs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku                          = "PerGB2018"
  retention_in_days            = 30
  local_authentication_enabled = true
}

resource "azurerm_container_app_environment" "env" {
  name                = "hello-ai-env"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
    minimum_count         = 0
    maximum_count         = 0
  }
}

resource "azurerm_container_app" "hello_ai_dev" {
  name                         = "hello-ai"
  resource_group_name          = azurerm_resource_group.rg.name
  container_app_environment_id = azurerm_container_app_environment.env.id

  revision_mode = "Single"

  template {
    container {
      name   = "hello-ai"
      image  = "helloaiacr.azurecr.io/hello-ai:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8000

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }
}