resource "azurerm_log_analytics_workspace" "this" {
  name                = var.monitor_values.workspace_name
  location            = var.monitor_values.location
  resource_group_name = var.monitor_values.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = var.monitor_values.retention_days
}

output "workspace_id" { value = azurerm_log_analytics_workspace.this.id }
