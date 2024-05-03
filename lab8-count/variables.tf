
variable "location" {
  description = "The region in which the resources will be deployed"
  type        = string
  default     = "east asia"
}
variable "name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg_name"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet_name"
}

variable "vnet_count" {
  type    = number
  default = 0
}
