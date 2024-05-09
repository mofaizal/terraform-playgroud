
variable "resource_group_name" {
  type        = string
  description = "The resource group where the resources will be deployed."
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name must not be empty."
  }
  validation {
    condition     = can(regex("^[a-z0-9-]{3,24}$", var.resource_group_name))
    error_message = "The name must be between 3 and 24 characters long and can only contain lowercase letters, numbers and dashes."
  }
  default = "rgname"
}

# Variable declaration for the  resource location
variable "location" {
  type        = string
  description = "The Azure regional location where the resources will be deployed."
  validation {
    condition     = length(var.location) > 0
    error_message = "The azure region must not be empty."
  }
  default = "southeast asia"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "storagename"
  validation {
    condition     = can(regex("^[a-z0-9-]{3,24}$", var.storage_account_name))
    error_message = "The name must be between 3 and 24 characters long and can only contain lowercase letters, numbers and dashes."
  }

}

variable "account_replication_type" {
  description = "The type of replication to use for the storage account"
  type        = string

  validation {
    condition     = var.account_replication_type != "LRS" || var.account_replication_type != "ZRS"
    error_message = "The account_replication_type must be either 'LRS' or 'ZRS'."
  }
  default = "LRS"
}
