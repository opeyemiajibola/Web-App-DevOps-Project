# aks-cluster/variables.tf

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "myakscluster"
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster is deployed."
  type        = string
  default     = "UK South"
}

#optional
variable "dns_prefix" {
  description = "The DNS prefix for the cluster."
  type        = string
  default     = null
}
# to be reviewed
variable "kubernetes_version" {
  description = "The version of Kubernetes to be used for the AKS cluster."
  type        = string
  default     = "1.26.6"
}
# to be completed
variable "service_principal_client_id" {
  description = "The Client ID of the service principal used for authenticating and managing the AKS cluster."
  type        = string
  default     = " "
}
#to be completed
variable "service_principal_client_secret" {
  description = "The Client Secret associated with the service principal used for AKS cluster."
  type        = string
  default     = " "
}

# Input variables from the networking module
variable "resource_group_name" {
  description = "The resource group name from networking module."
  type        = string
  default     = "$module.networking-module.resource_group_name"
}

variable "vnet_id" {
  description = "The virtual network id from the networking module."
  type        = string
  default     = "$module.networking-module.vnet_id"
}
