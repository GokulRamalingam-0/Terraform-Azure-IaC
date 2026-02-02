variable "location" {
  type    = string
  default = "West US"
}

variable "rg_name" {
  type    = string
  default = "kml_rg_main-8e29a91c850745b8"
}

variable "prefix" {
  type    = string
  default = "demo"
}

variable "kubernetes_version" {
  type    = string
  default = "1.30.1"
}
