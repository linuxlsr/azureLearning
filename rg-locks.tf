#rg locks
resource "azurerm_management_lock" "lock-tfstate-rg" {
  lock_level = "CanNotDelete"
  name       = "locked-tfstate-rg"
  scope      = azurerm_resource_group.tfstate.id
  notes      = "no delete tfstate rg"
}

//resource "azurerm_management_lock" "lock-first-rg" {
//  lock_level = "CanNotDelete"
//  name       = "locked-first-rg"
//  scope      = azurerm_resource_group.first_rg.id
//  notes      = "no delete first rg"
//}

resource "azurerm_management_lock" "lock-ephemeral-rg" {
  lock_level = "CanNotDelete"
  name       = "locked-ephemeral-rg"
  scope      = azurerm_resource_group.ephemeral.id
  notes      = "testing deletion of throwaway resource group"
}