variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type    = string
  default = "techassessrg"
}

variable "storage_account_name" {
  type    = string
  default = "tfsa"
}

variable "container_name" {
  type    = string
  default = "statefilecontainer"
}

variable "aks_cluster_name" {
  type    = string
  default = "akscluster"
}

variable "dns_prefix" {
  type    = string
  default = "apiaks"
}

variable "acr_name" {
  type    = string
  default = "aksacr"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}

variable "os_disk_size_gb" {
  type    = number
  default = 30
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}

variable "acr_admin_enabled" {
  type    = bool
  default = true
}

variable "nginx_version" {
  type    = string
  default = "1.10.0"
}

variable "nginx_repo_name" {
  type    = string
  default = "nginx-stable"
}

variable "nginx_name" {
  type    = string
  default = "nginx-ingress"
}