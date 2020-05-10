# high level combination of AWS resource groups and tags, but is the first step, rather than bolted on afterwards.

// practice rg
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

# to test console created resources
resource "azurerm_resource_group" "console" {
  name     = "console_built"
  location = var.location
  tags     = merge({ Name = "console_built" }, local.common_tags)
}

resource "azurerm_resource_group" "ephemeral" {
  name     = "ephemeral"
  location = var.location
  tags     = merge({ Name = "ephemeral" }, local.common_tags)
}

