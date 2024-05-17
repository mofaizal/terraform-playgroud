variable "rg_name" {
  type        = string
  description = "The name for the resource group and storage account"
}

variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "account_replication_type" {
  type        = string
  description = "The replication type for the storage account"

}

variable "storage_account_type" {
  type        = string
  description = "The type of storage account to create"

}

variable "storage_name" {
  type        = string
  description = "The name of the storage account"

}
