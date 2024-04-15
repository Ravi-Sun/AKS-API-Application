
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
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

  tags = {
    environment = var.environment
  }

  identity {
    type = "SystemAssigned"
  }
}

data "local_file" "kubeconfig" {
  content  = azurerm_kubernetes_cluster.aks.kube_config_raw
  filename = "~/.kube/config/kubeconfig.yaml"
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

  depends_on = [
    azurerm_kubernetes_cluster.aks,
    azurerm_container_registry.acr
  ]
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

  namespace = "default"

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

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}
