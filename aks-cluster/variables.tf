# variable "prefix" { type = string }
# variable "rg_name" { type = string }
# variable "location" { type = string }
# variable "kubernetes_version" { type = string }
# variable "log_analytics_workspace_id" { type = string }

variable "aks_values" {
  description = "Contians collection of AKS Cluster Variable values"
  type = object({
    prefix                     = string
    rg_name                    = string
    location                   = string
    kubernetes_version         = string
    log_analytics_workspace_id = string
  })
}
