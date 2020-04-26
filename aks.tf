module "service-principal" {
  source   = "innovationnorway/service-principal/azurerm"
  version  = "1.0.4"
  years    = 1
  end_date = "2020-05-31T00:00:00Z"
  name     = "aks-service-principal"
  password = var.db_password
  role     = ""
  scopes   = []
}

# basic azure aks module
module "aks" {
  source                         = "Azure/aks/azurerm"
  version                        = "4.0.0"
  resource_group_name            = azurerm_resource_group.first_rg.name
  prefix                         = "linuxlsr"
  client_id                      = module.service-principal.client_id
  client_secret                  = module.service-principal.client_secret
  admin_username                 = var.admin_username
  agents_size                    = "Standard_D2s_v3"
  log_analytics_workspace_sku    = "PerGB2018"
  log_retention_in_days          = 14
  agents_count                   = 3
  public_ssh_key                 = file("./id_rsa.pub")
  tags                           = merge({ Name = "first aks cluster" }, local.common_tags)
  enable_log_analytics_workspace = false
}