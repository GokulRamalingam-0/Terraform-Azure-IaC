terraform {
  required_version = ">= 1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.16.0"
    }
    random = { source = "hashicorp/random" }
  }

  backend "azurerm" {
    resource_group_name  = "kml_rg_main-876bc406a54f49cc"
    storage_account_name = "tfstate41601"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

module "monitoring" {
  source = "./monitor"
  monitor_values = {
    rg_name        = var.module_variables.rg_name
    location       = var.module_variables.location
    workspace_name = "${var.module_variables.prefix}-law"
    retention_days = 30
  }
}

module "aks_cluster" {
  source = "./aks-cluster"
  aks_values = {
    prefix                     = var.module_variables.prefix
    rg_name                    = var.module_variables.rg_name
    location                   = var.module_variables.location
    kubernetes_version         = var.module_variables.kubernetes_version
    log_analytics_workspace_id = module.monitoring.workspace_id
  }
}

# module "key_vault" {
#   source = "./key_vault"
#   key_vault_values = {
#     rg_name        = var.module_variables.rg_name
#     location       = var.module_variables.location
#     key_vault_name = var.module_variables.key_vault_name
#   }
# }

# module "linux_vm" {
#   source = "./azure_vm"
#   vm_details = {
#     rg_name  = var.module_variables.rg_name
#     location = var.module_variables.location
#   }
# }

# module "contiainer_registry" {
#   source = "./azure_container_registry"
#   acr_values = {
#     rg_name  = var.module_variables.rg_name
#     location = var.module_variables.location
#   }
# }
