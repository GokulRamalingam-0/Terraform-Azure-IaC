variable "location" {
  type    = string
  default = "West US"
}

variable "rg_name" {
  type    = string
  default = "kml_rg_main-d90cc5f5d9ed4af7"
}

variable "prefix" {
  type    = string
  default = "demo"
}

variable "kubernetes_version" {
  type    = string
  default = "1.30.1"
}
