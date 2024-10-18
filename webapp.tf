
# Resource Groups
resource "azurerm_resource_group" "rg_canada_east" {
  name     = "rg-webapp-canadaeast"
  location = "canadaeast"
}

resource "azurerm_resource_group" "rg_canada_central" {
  name     = "rg-webapp-canadacentral"
  location = "canadacentral"
}

# App Service Plans
resource "azurerm_app_service_plan" "plan_canada_east" {
  name                = "appserviceplan-canadaeast"
  location            = azurerm_resource_group.rg_canada_east.location
  resource_group_name = azurerm_resource_group.rg_canada_east.name
    sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_app_service_plan" "plan_canada_central" {
  name                = "appserviceplan-westeurope"
  location            = azurerm_resource_group.rg_canada_central.location
  resource_group_name = azurerm_resource_group.rg_canada_central.name
    sku_name            = "P1v2"
  os_type             = "Windows"
}

# Web Apps
resource "azurerm_app_service" "webapp_east_us" {
  name                = "my-webapp-eastus"
  location            = azurerm_resource_group.rg_canada_east.location
  resource_group_name = azurerm_resource_group.rg_canada_east.name
  app_service_plan_id = azurerm_app_service_plan.plan_canada_east.id

}

resource "azurerm_app_service" "webapp_west_europe" {
  name                = "my-webapp-westeurope"
  location            = azurerm_resource_group.rg_canada_central.location
  resource_group_name = azurerm_resource_group.rg_canada_central.name
  app_service_plan_id = azurerm_app_service_plan.plan_canada_central.id

}
