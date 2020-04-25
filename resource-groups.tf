# high level combination of AWS resource groups and tags, but is the first step, rather than bolted on afterwards.

resource "azurerm_resource_group" "first_rg" {
  name     = "first_resource_group"
  location = var.location
  tags = merge({
    Name = "first resource group" },
  local.common_tags)
}

# for tfstate
resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = var.location
  tags     = merge({ Name = "tfstate-rg" }, local.common_tags)
}

# for console testing of resource creation, module doesn't save any time. module introduces features required field not set error
//module "resource-group" {
//  source   = "rink72/resource-group/azurerm"
//  version  = "1.0.0"
//  name     = "console_built"
//  location = var.location
//  tags     = merge({ Name = "console_built" }, local.common_tags)
//}
resource "azurerm_resource_group" "console" {
  name     = "console_built"
  location = var.location
  tags     = merge({ Name = "console_built" }, local.common_tags)
}