#state storage
resource "azurerm_storage_account" "state_storage_account" {
  account_replication_type = "GRS"
  account_tier             = "Standard"
  location                 = var.location
  name                     = "tfstatesalinuxlsr"
  resource_group_name      = azurerm_resource_group.tfstate.name
}

//# general storage
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

#container for general storage
resource "azurerm_storage_container" "gsa_container" {
  name                 = "gsa-storage"
  storage_account_name = azurerm_storage_account.general_storage_account.name
}

# container for state file
resource "azurerm_storage_container" "tfstate_container" {
  name                 = "tfstatestorage"
  storage_account_name = azurerm_storage_account.state_storage_account.name
}

# blob storage
resource "azurerm_storage_blob" "gsa_blob" {
  name                   = "gsa-blob"
  storage_account_name   = azurerm_storage_account.general_storage_account.name
  storage_container_name = azurerm_storage_container.gsa_container.name
  type                   = "Block"
}

# share storage
resource "azurerm_storage_share" "gsa_share" {
  name                 = "gsa-share"
  storage_account_name = azurerm_storage_account.general_storage_account.name
  quota                = 50
}

# storage module test
//module "storage" {
//  source  = "innovationnorway/storage/azurerm"
//  version = "1.1.0"
//  name    = "teststoragemodule"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  https_only  = true
//}