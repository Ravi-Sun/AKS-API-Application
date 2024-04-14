
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storagecontainer" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  sku                      = var.acr_sku
  admin_enabled            = var.acr_admin_enabled
}

resource "azurerm_role_assignment" "aks_acr_role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}


resource "helm_repository" "nginx_stable" {
  name = var.nginx_repo_name
  url  = "https://helm.nginx.com/stable"
}

resource "helm_release" "nginx_ingress" {
  name       = var.nginx_name
  repository = helm_repository.nginx_stable.metadata.0.name
  chart      = "nginx-ingress"
  version    = var.nginx_version

  namespace = "kube-system"

  set {
    name  = "rbac.create"
    value = "true"
  }
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}