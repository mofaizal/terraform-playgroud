<!-- BEGIN_TF_DOCS -->
# Default example

#What is a resource group

A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. Generally, add resources that share the same lifecycle to the same resource group so you can easily deploy, update, and delete them as a group.

This is Resource group module script using terraform. (for learning demo)

```hcl
resource "azurerm_resource_group" "this" {
  name     = var.rg_name
  location = var.location
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Resources

The following resources are used by this module:

- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name)

Description: n/a

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: n/a

Type: `string`

Default: `"West US"`

## Outputs

The following outputs are exported:

### <a name="output_rg_details"></a> [rg\_details](#output\_rg\_details)

Description: n/a

## Modules

No modules.


This is example used in Technology with Faizal YouTube demo
<!-- END_TF_DOCS -->