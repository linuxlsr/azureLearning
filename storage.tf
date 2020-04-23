#state storage
resource "azurerm_storage_account" "state_storage_account" {
  account_replication_type = "GRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "tfstatesalinuxlsr"
  resource_group_name      = azurerm_resource_group.tfstate.name
}

# general storage
resource "azurerm_storage_account" "general_storage_account" {
  account_replication_type = "GRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "generalsalinuxlsr"
  resource_group_name      = azurerm_resource_group.first_rg.name
}

# recovery service vaults
resource "azurerm_recovery_services_vault" "gsa_vault" {
  location            = var.location
  name                = "gsa-rsv"
  resource_group_name = azurerm_resource_group.first_rg.name
  sku                 = "Standard"
}

resource "azurerm_recovery_services_vault" "tfstate_vault" {
  location            = var.location
  name                = "tfstate-rsv"
  resource_group_name = azurerm_resource_group.tfstate.name
  sku                 = "Standard"
}

# container for state file
resource "azurerm_storage_container" "tfstate_container" {
  name                 = "tfstatestorage"
  storage_account_name = azurerm_storage_account.state_storage_account.name
}