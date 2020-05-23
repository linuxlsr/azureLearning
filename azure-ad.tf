resource "azuread_user" "test_user" {
  user_principal_name = var.first_user_upn
  display_name        = "Test User"
  mail_nickname       = "testuser"
  password            = var.first_user_pwd
}