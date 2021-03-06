# builds VMs, IPs, NICs, availability sets, security group.
# for nginx ha set
//module "nginx_ha" {
//  source = "./custom_modules/vm"
//  #version                       = "3.1.0"
//  resource_group_name           = azurerm_resource_group.first_rg.name
//  vm_os_simple                  = "UbuntuServer"
//  vnet_subnet_id                = module.network.vnet_subnets[0]
//  admin_username                = var.admin_username
//  boot_diagnostics              = true
//  custom_data                   = base64encode(file("scripts/linux_vm_patch.sh"))
//  data_disk_size_gb             = 10
//  delete_os_disk_on_termination = true
//  enable_ssh_key                = true
//  nb_data_disk                  = 0
//  nb_instances                  = "3"
//  load_balancer_backend_pool_ip = azurerm_lb_backend_address_pool.lb_be_pool.id
//  nb_public_ip                  = "0"
//  public_ip_dns                 = ["linuxlsr1"] # without this, if public ip NE 0, module will error out.
//  ssh_key                       = "/home/azureLearning/id_rsa.pub"
//  storage_account_type          = "StandardSSD_LRS"
//  tags                          = merge({ Name = "test vm" }, local.common_tags)
//  vm_hostname                   = "testvm0"
//  vm_size                       = var.vmsize
//}

//# bastion host deployment
//module "linux_vm" {
//  source = "./custom_modules/vm"
//  #version                       = "3.1.0"
//  resource_group_name           = azurerm_resource_group.first_rg.name
//  vm_os_simple                  = "UbuntuServer"
//  vnet_subnet_id                = module.network.vnet_subnets[0]
//  admin_username                = var.admin_username
//  boot_diagnostics              = true
//  custom_data                   = base64encode(file("scripts/linux_vm_patch.sh"))
//  data_disk_size_gb             = 10
//  delete_os_disk_on_termination = true
//  enable_ssh_key                = true
//  nb_data_disk                  = 0
//  nb_instances                  = "1"
//  nb_public_ip                  = "1"
//  public_ip_dns                 = ["linuxlsrbastion"] # without this, if public ip NE 0, module will error out.
//  ssh_key                       = "/home/azureLearning/id_rsa.pub"
//  storage_account_type          = "StandardSSD_LRS"
//  tags                          = merge({ Name = "test vm" }, local.common_tags)
//  vm_hostname                   = "bastion"
//  vm_size                       = var.vmsize
//}