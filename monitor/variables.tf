variable "monitor_values" {
    description = "Collection of Azure Monitor Variable values"
    type = object({
      rg_name = string
      location = string
      workspace_name = string
      retention_days = number
    })
}
