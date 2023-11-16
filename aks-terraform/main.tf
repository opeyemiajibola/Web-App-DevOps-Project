terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "74f4fca2-6dfd-40ef-8c41-4216eb6cb423"
  client_secret   = "tnN8Q~5Ik9MvWiYXxwj2dwd1B_zW5f3ZOI3HaaWf"
  subscription_id = "bff39c62-8e6f-4cf1-8fbb-28940173582a"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  resource_group_name = "networking-rg"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]

}

module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  aks_cluster_name                = "terraform-aks-cluster"
  cluster_location                = "UK South"
  dns_prefix                      = "myaks-project"
  kubernetes_version              = "1.26.6"                                   # Adjust the version as needed
  service_principal_client_id     = "73459029-6f21-4045-829f-48ff79150e22"     # to be completed myWebApp
  service_principal_client_secret = "tnN8Q~5Ik9MvWiYXxwj2dwd1B_zW5f3ZOI3HaaWf" # to be completed

  # Input variables referencing outputs from the networking module
  resource_group_name     = module.networking.resource_group_name
  vnet_id                 = module.networking.vnet_id
  control_plane_subnet_id = module.networking.control_plane_subnet_id
  worker_node_subnet_id   = module.networking.worker_node_subnet_id
  aks_nsg_id              = module.networking.aks_nsg_id

}