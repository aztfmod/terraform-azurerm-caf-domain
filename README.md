# **READ ME**

Thanks for your interest in Cloud Adoption Framework for Azure landing zones on Terraform.
This module is now deprecated and no longer maintained. 

As part of Cloud Adoption Framework landing zones for Terraform, we have migrated to a single module model, which you can find here: https://github.com/aztfmod/terraform-azurerm-caf and on the Terraform registry: https://registry.terraform.io/modules/aztfmod/caf/azurerm 

In Terraform 0.13 you can now call directly submodules easily with the following syntax:
```hcl
module "caf_firewall" {
  source  = "aztfmod/caf/azurerm//modules/networking/firewall"
  version = "0.4.18"
  # insert the 9 required variables here
}
```


[![VScodespaces](https://img.shields.io/endpoint?url=https%3A%2F%2Faka.ms%2Fvso-badge)](https://online.visualstudio.com/environments/new?name=terraform-azurerm-caf-domain&repo=aztfmod/terraform-azurerm-caf-domain)

# Creates an Azure DNS zone with domain registration

Creates a domain name with its registration details using:
* Azure DNS name
* Azure App Service Domain

Reference the module to a specific version (recommended):
```hcl
module "domain" {
    source  = "aztfmod/caf-sql-domain/azurerm"
    version = "0.x.y"

    prefix              = var.prefix
    resource_group_name = var.resource_group_name
    tags                = var.tags
    name                = var.name
    location            = var.location
    contract            = var.contract
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| contract | (Required) contract fields for the domain name registration | <pre>object({<br>    name_first  = string<br>    name_last   = string<br>    email       = string<br>    phone       = string<br>    job_title   = string<br>    address1    = string<br>    address2    = string<br>    postal_code = string<br>    state       = string<br>    city        = string<br>    country     = string<br>    auto_renew  = bool<br>  })</pre> | n/a | yes |
| location | Default location to create the resources | `string` | n/a | yes |
| lock\_domain | (Required) Determines to put a Azure lock after create the domain | `bool` | `false` | no |
| lock\_zone | (Required) Determines to put a Azure lock after creating the zone | `bool` | `false` | no |
| name | (Required) Name of the Domain to be created | `string` | n/a | yes |
| prefix | n/a | `string` | n/a | yes |
| resource\_group\_name | (Required) Resource group name | `string` | n/a | yes |
| tags | map of the tags to be applied | `map(string)` | n/a | yes |

## Output

| Name | Description |
|------|-------------|
| dns\_zone\_id | DNS Zone resource ID |
| dns\_zone\_name | DNS Zone name |
| dns\_zone\_object | DNS Zone resource object |
| domain\_id | n/a |
