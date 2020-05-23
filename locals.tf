locals {
  common_tags = {
    Environment = var.environment
    Application = var.application
    Creator     = var.creator
    Repo        = var.repo
    Infra       = var.infra
  }
}

data "azurerm_subscription" "primary" {}

data "azurerm_client_config" "client" {}

data "azurerm_role_definition" "builtin_reader" {
  name = "Reader"
}
//data "azure_key_vault" "mykeyvault" {
//  name          = azurerm_key_vault.key_vault.name
//  resource_group_name = azurerm_resource_group.first_rg.name
//}

//data "azurerm_builtin_role_definition" "contributor" {
//  name = "Contributor"
//}
//
//resource "azurerm_role_assignment" "contributor" {
//  scope                = var.subscription_id
//  role_definition_name = "Contributor"
//  principal_id         = var.tenant_id
//  role_definition_id   = "${var.subscription_id}${data.azurerm_builtin_role_definition.contributor.id}"
//}
//
//data "azurerm_subscription" "primary" {
//  scope                = "/subscriptions/${var.subscription_id}"
//  role_definition_name = "Contributor"
//  principal_id         = var.tenant_id
//}