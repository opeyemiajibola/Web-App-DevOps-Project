variable "resource_group_name" {
  description = "The name of the resource group where networking resource will be deployed."
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  description = "Specifices the Azure region where networking resources will be deployed."
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
