terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}


provider "azurerm" {
  features {}
}

variable "my_map" {
  type = map(object({
    attribute1 = string
    attribute2 = string
  }))
  default = {
    key1 = {
      attribute1 = "value1"
      attribute2 = "value2"
    }
    key2 = {
      attribute1 = "value3"
      attribute2 = "value4"
    }
  }
}


# resource "example_resource" "example" {
#   for_each = var.my_map

#   name       = each.key
#   attribute1 = each.value.attribute1
#   attribute2 = each.value.attribute2
# }

output "example_output" {
  value = {
    for key, value in var.my_map : key => {
      name       = each.key
      attribute1 = each.attribute1
      attribute2 = each.attribute2
    }
  }
}
