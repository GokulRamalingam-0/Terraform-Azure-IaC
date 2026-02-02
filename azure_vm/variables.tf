variable "vm_details" {
  description = "Collection of VM details"
  type = object({
    rg_name        = string
    vm_size        = optional(string,"Standard_DS1_v2")
    admin_password = optional(string, "Welcome@1432")
    admin_username = optional(string, "ubuntu")
    location       = string
    vm_name        = optional(string,"pipieline-agent")
  })
  default = {
    vm_name = "pipeline-agent"
    vm_size  = "Standard_DS1_v2"
    rg_name  = "default-rg"
    location = "West US"
  }
}
