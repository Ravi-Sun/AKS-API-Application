provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Specify the path to your Kubernetes config file
  }
}