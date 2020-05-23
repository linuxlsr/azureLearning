//resource "azurerm_role_definition" "read_only" {
//  name        = "custom-read-only-role"
//  scope       = data.azurerm_subscription.primary.id
//  description = "custom read only role"
//  permissions {
//    actions     = ["Microsoft.Resources/subscriptions/*/read"]
//    not_actions = []
//  }
//  assignable_scopes = [data.azurerm_subscription.primary.id]
//}
//
//resource "azurerm_role_assignment" "read_only_role_assignment" {
//  role_definition_id = azurerm_role_definition.read_only.id
//  scope              = data.azurerm_subscription.primary.id
//  principal_id       = azuread_user.read_only.id
//}


resource "azurerm_role_assignment" "read_only_role_assignment" {
  scope              = data.azurerm_subscription.primary.id
  principal_id       = azuread_group.g_readonly.id
  role_definition_id = data.azurerm_role_definition.builtin_reader.id
}

resource "azurerm_role_assignment" "contributor_role_assignment" {
  scope              = data.azurerm_subscription.primary.id
  principal_id       = azuread_user.big_dog.id
  role_definition_id = data.azurerm_role_definition.admin.id
}