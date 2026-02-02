variable "module_variables" {
  description = "This Objects contains collection of module variables"
  type = object({
    rg_name = string
    location = string
    prefix  = string
    kubernetes_version = string
    key_vault_name = string
  })
  default = {
    key_vault_name = "docker-key-vault412"
    rg_name = "kml_rg_main-8e29a91c850745b8"
    location = "West US"
    prefix  = "demo"
    kubernetes_version = "1.33.5"
  }
}
