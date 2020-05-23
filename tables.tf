resource "azurerm_storage_table" "first_table" {
  name                  = "firsttable"
  storage_account_name  = azurerm_storage_account.general_storage_account.name
}

resource "azurerm_storage_queue" "first-queue" {
  name                  = "firstqueue"
  storage_account_name  = azurerm_storage_account.general_storage_account.name
}