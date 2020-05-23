#users
resource "azuread_user" "test_user" {
  user_principal_name = var.first_user_upn
  display_name        = "Test User"
  mail_nickname       = "testuser"
  password            = var.first_user_pwd
}

resource "azuread_user" "read_only" {
  user_principal_name = var.read_only_upn
  display_name        = "Read Only"
  mail_nickname       = "readonly"
  password            = var.read_only_pwd
}

resource "azuread_user" "big_dog" {
  user_principal_name = var.big_dog_upn
  display_name        = "Big Dog"
  mail_nickname       = var.admin_username
  password            = var.big_dog_pwd
}

#groups
resource "azuread_group" "g_readonly" {
  name    = "read-only-group"
  members = [azuread_user.read_only.object_id]
}

