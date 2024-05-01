# Authenticate using the Azure CLI


Provision Azure Resource Group using Terraform resource block and provider 

create main.tf file 

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
  name     = "example-resources"
  location = "East US"
}
```

**Login to Azure**

Terraform must authenticate to Azure to create infrastructure.

In your terminal, use the Azure CLI tool to setup your account permissions locally.

```
az login
az account set --subscription "35akss-subscription-id"

```

**Initialize your Terraform configuration**

Initialize your learn-terraform-azure directory in your terminal. The terraform commands will work with any operating system. Your output should look similar to the one below.

```
terraform init

```

Format and validate the configuration
We recommend using consistent formatting in all of your configuration files. The terraform fmt command automatically updates configurations in the current directory for readability and consistency.

```
terraform fmt

```

Apply your Terraform Configuration
Run the terraform apply command to apply your configuration.

```
terraform apply

```

**Inspect your state**
When you apply your configuration, Terraform writes data into a file called terraform.tfstate. This file contains the IDs and properties of the resources Terraform created so that it can manage or destroy those resources going forward.

```
terraform show

terraform state list

terraform state
```

