# high level combination of AWS resource groups and tags, but is the first step, rather than bolted on afterwards.
resource "azurerm_resource_group" "first_rg" {
  name     = "first_resource_group"
  location = var.location
  tags = merge({
    Name = "first resource group" },
  local.common_tags)
}