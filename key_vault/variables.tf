variable "key_vault_values" {
  description = "Collection of Key vault values"
  type = object({
    location = string
    rg_name = string
    key_vault_name = string
  })
  default = {
    key_vault_name = "azure_key_vault"
    location = ""
    rg_name = ""
  }
}