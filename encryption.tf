//resource "random_id" "my_seed" {
//  byte_length = 8
//}

resource "azurerm_key_vault_key" "first_key" {
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  key_size     = 2048
  key_type     = "RSA"
  key_vault_id = azurerm_key_vault.key_vault.id
  name         = "first-key"
}

resource "azurerm_key_vault_secret" "first_secret" {
  key_vault_id = azurerm_key_vault.key_vault.id
  name         = "superdoopersekret"
  value        = var.key_vault_secret
}

output "key_id" {
  value = azurerm_key_vault_key.first_key.id
}

output "secret_id" {
  value = azurerm_key_vault_secret.first_secret.id
}