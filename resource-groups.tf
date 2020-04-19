# high level combination of AWS resource groups and tags, but is the first step, rather than bolted on afterwards.

# TODO create policy defition to restrict region
# TODO create policy assignment to apply to resource group

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
  tags = merge({
    Name = "tfstate-rg" },
  local.common_tags)
}