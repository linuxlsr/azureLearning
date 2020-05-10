# recovery service vaults
resource "azurerm_recovery_services_vault" "gsa_vault" {
  location            = var.location
  name                = "gsa-rsv"
  resource_group_name = azurerm_resource_group.first_rg.name
  sku                 = "Standard"
  soft_delete_enabled = false
}

resource "azurerm_recovery_services_vault" "tfstate_vault" {
  location            = var.location
  name                = "tfstate-rsv"
  resource_group_name = azurerm_resource_group.tfstate.name
  sku                 = "Standard"
}

# experiment - create rsv first, which then creates file storage artifacts
resource "azurerm_recovery_services_vault" "personal_vault" {
  location            = var.location
  name                = "personal-rsv"
  resource_group_name = azurerm_resource_group.first_rg.name
  sku                 = "Standard"
}