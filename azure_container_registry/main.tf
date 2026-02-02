resource "azurerm_container_registry" "acr" {
  name                              = var.acr_values.name
  resource_group_name               = var.acr_values.rg_name
  location                          = var.acr_values.location
  sku                               = var.acr_values.sku
  admin_enabled                     = var.acr_values.admin_enabled
  public_network_access_enabled     = var.acr_values.public_network_access_enabled
}