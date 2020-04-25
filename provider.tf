#variables not allowed in backend block
provider "azurerm" {
  features {}
  version = ">2.5.0"
}

# backend config vars removed and executed as a script that gets access key and initializes remote backend.
terraform {
  backend "azurerm" {}
}