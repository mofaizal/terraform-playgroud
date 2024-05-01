#What is Terraform Variables

Terraform variables are placeholders within Terraform configurations that allow users to parameterize values and make configurations more flexible and reusable. They enable users to pass values dynamically to resources and modules, making configurations adaptable to different environments or scenarios.

Here's how Terraform variables are used in Terraform with an Azure example:

**Terraform Variables:**
**Definition:**

- Terraform variables are declared using the `variable` block in Terraform configuration files.
- They can represent various types of values, such as strings, numbers, lists, maps, etc.
- Variables can have default values, making them optional to provide when executing Terraform commands.

**Usage:**

- Variables can be referenced within resource configurations using interpolation syntax `(${var.variable_name})`
- When Terraform is executed, it prompts users to provide values for variables that do not have default values
- Values for variables can be provided using command-line flags, environment variables, or variable definition files.

Suppose we want to create an Azure Resource in Terraform with customizable parameters such as location, and resource group name using variables.

```
variable "location" {
  description = "The region in which the resources will be deployed"
  type        = string
  default     = "southeast asia"
}

variable "name" {
  description = "The name of the resource group"
  type        = string
  default     = "example-resources"
}

```
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

resource "azurerm_resource_group" "example" {
  name     = var.name
  location = var.location
}
```

```