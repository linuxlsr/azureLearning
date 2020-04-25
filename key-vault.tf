//resource "azurerm_key_vault" "key_vault" {
//  location                    = var.location
//  name                        = "firstkvlinuxlsr"
//  resource_group_name         = azurerm_resource_group.first_rg.name
//  tenant_id                   = var.tenant_id
//  sku_name                    = "standard"
//  enabled_for_disk_encryption = true
//  tags = merge({
//    Name = "test key vault" },
//  local.common_tags)
//}
//
//#access policy for key vault
////resource "azurerm_key_vault_access_policy" "local_acess" {
////  object_id = ""
////  tenant_id = var.tenant_id
////}
