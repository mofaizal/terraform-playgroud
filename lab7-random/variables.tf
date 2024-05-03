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

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "storage_name"
}
