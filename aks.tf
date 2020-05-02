//module "service-principal" {
//  source   = "innovationnorway/service-principal/azurerm"
//  version  = "1.0.4"
//  years    = 1
//  end_date = "2020-05-31T00:00:00Z"
//  name     = "aks-service-principal"
//  password = var.db_password
//  role     = ""
//  scopes   = []
//}
//
//# basic azure aks module
//module "aks" {
//  source                         = "Azure/aks/azurerm"
//  version                        = "4.0.0"
//  resource_group_name            = azurerm_resource_group.first_rg.name
//  prefix                         = "linuxlsr"
//  client_id                      = module.service-principal.client_id
//  client_secret                  = module.service-principal.client_secret
//  admin_username                 = var.admin_username
//  agents_size                    = "Standard_D2s_v3"
//  log_analytics_workspace_sku    = "PerGB2018"
//  log_retention_in_days          = 14
//  agents_count                   = 3
//  public_ssh_key                 = file("./id_rsa.pub")
//  tags                           = merge({ Name = "first aks cluster" }, local.common_tags)
//  enable_log_analytics_workspace = false
//}

//module "aks" {
//  source                           = "edalferes/aks/azure"
//  version                          = "1.3.0-release.198995"
//  admin_username                   = var.admin_username
//  auto_scaling_default_node        = true
//  location                         = var.location
//  netwok_resource_group            = azurerm_resource_group.first_rg.name
//  network_subnet                   = var.firewall_subnet
//  network_vnet                     = module.network.vnet_name
//  node_count                       = "3"
//  node_max_count                   = "5"
//  node_min_count                   = "1"
//  prefix                           = "linuxlsr"
//  resource_group                   = azurerm_resource_group.first_rg.name
//  storage_account_name             = azurerm_storage_account.general_storage_account.name
//  additional_node_pools            = {}
//  end_date                         = "2020-05-31T00:00:00Z"
//  k8s_version                      = "1.15.10"
//  max_pods                         = 10
//  rbac_enabled                     = true
//  storage_account_kind             = "BlobStorage"
//  storage_account_replication_type = "LRS"
//  storage_account_tier             = "Standard"
//  vm_size                          = var.vmsize
//  tags                             = merge({ Name = "second aks cluster" }, local.common_tags)
//}