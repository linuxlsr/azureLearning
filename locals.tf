locals {
  common_tags = {
    Environment = var.environment
    Application = var.application
    Creator     = var.creator
  }
}

//data "azure_key_vault" "mykeyvault" {
//  name          = azurerm_key_vault.key_vault.name
//  resource_group_name = azurerm_resource_group.first_rg.name
//}