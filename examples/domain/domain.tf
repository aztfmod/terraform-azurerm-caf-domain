provider "azurerm" {
  features {}
}

resource "azurecaf_naming_convention" "rg_test" {
  name          = local.resource_groups.test.name
  prefix        = local.prefix != "" ? local.prefix : null
  postfix       = local.postfix != "" ? local.postfix : null
  max_length    = local.max_length != "" ? local.max_length : null
  resource_type = "azurerm_resource_group"
  convention    = local.convention
}

resource "azurerm_resource_group" "rg_test" {
  name     = azurecaf_naming_convention.rg_test.result
  location = local.resource_groups.test.location
  tags     = local.tags
}

resource "random_string" "random" {
  length  = 16
  special = false
  upper   = false
}

module "domain" {
  source = "../.."

  prefix              = local.prefix
  resource_group_name = azurerm_resource_group.rg_test.name
  tags                = local.tags
  name                = format("%s.com", random_string.random.result)
  location            = local.location
  contract            = local.contract
  lock_zone           = local.lock_zone
  lock_domain         = local.lock_domain
}




