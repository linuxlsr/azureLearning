#variables not allowed in backend block
provider "azurerm" {
  features {}
  version = ">2.5.0"
}

provider "random" {
  version = "~>2.2"
}

provider "tls" {
  version = "~>2.1"
}

provider "azuread" {
  version = "~>0.8"
}

provider "local" {
  version = "~>1.4"
}

//provider "azuredevops" {
//  version = ">= 0.0.1"
//}

# backend config vars removed and executed as a script that gets access key and initializes remote backend.
terraform {
  backend "azurerm" {}
}