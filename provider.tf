#variables not allowed in backend block
provider "azurerm" {
  version = "=2.0.0"
  features {}
}

# backend config vars removed and executed as a script that gets access key and initializes remote backend.
//terraform {
//  backend "azurerm" {}
//}
