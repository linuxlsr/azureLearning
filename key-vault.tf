resource "azurerm_key_vault" "key_vault" {
  location                    = var.location
  name                        = "firstkvlinuxlsr"
  resource_group_name         = azurerm_resource_group.first_rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  tags = merge({
    Name = "test key vault" },
  local.common_tags)
}

#access policy for key vault
resource "azurerm_key_vault_access_policy" "local_acess" {
  object_id    = data.azurerm_client_config.current.object_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  key_vault_id = azurerm_key_vault.key_vault.id
  key_permissions = [
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey",
  ]

  secret_permissions = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set",
  ]

  storage_permissions = [
    "backup",
    "delete",
    "get",
    "list",
    "purge",
    "recover",
    "restore",
    "set",
  ]
}
