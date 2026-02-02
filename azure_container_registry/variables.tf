variable "acr_values" {
    description = "Contains collection of ACR variables"
    type = object({
      rg_name = string
      location = string
      name = optional(string)
      sku = optional(string)
      admin_enabled = optional(bool)
      public_network_access_enabled = optional(bool, "true")
    })
    default = {
      location = "West US"
      rg_name = ""
      name = "assessment"
      sku = "Standard"
      admin_enabled = true
      public_network_access_enabled = true
    }
}