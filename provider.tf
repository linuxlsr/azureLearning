#variables not allowed in backend block
provider "azurerm" {
  version = "=2.0.0"
  features {}
}

//terraform {
//  backend "azurerm" {
//    resource_group_name   = "tfstate"
//    storage_account_name  = "tfstatesalinuxlsr"
//    key                   = "$ARM_ACCESS_KEY"
//    container_name        = "tfstatestorage"
//  }
//}