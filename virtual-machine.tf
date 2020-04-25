# builds VMs, IPs, NICs, availability sets, security group. Too public.
module "linux_vm" {
  source                        = "Azure/compute/azurerm"
  version                       = "3.1.0"
  resource_group_name           = azurerm_resource_group.first_rg.name
  vm_os_simple                  = "UbuntuServer"
  vnet_subnet_id                = module.network.vnet_subnets[0]
  admin_username                = var.admin_username
  boot_diagnostics              = true
  custom_data                   = base64encode(file("scripts/linux_vm_patch.sh"))
  data_disk_size_gb             = 100
  delete_os_disk_on_termination = true
  enable_ssh_key                = true
  nb_data_disk                  = 2
  nb_instances                  = "2"
  nb_public_ip                  = "2"
  public_ip_dns                 = ["linuxlsr1", "linuxlsr2"] # without this, if public ip NE 0, module will error out.
  ssh_key                       = "/home/azureLearning/id_rsa.pub"
  storage_account_type          = "StandardSSD_LRS"
  tags                          = merge({ Name = "test vm" }, local.common_tags)
  vm_hostname                   = "testvm0"
  vm_size                       = var.vmsize
}
//resource "azurerm_linux_virtual_machine" "testing" {
//  name                           = "test"
//  location                       = var.location
//  resource_group_name            = azurerm_resource_group.first_rg.name
//  network_interface_ids          = [azurerm_network_interface.test_vm_nic.id]
//  size                           = var.vmsize
//  admin_username                 = var.admin_username
//  custom_data                    = base64encode(file("scripts/linux_vm_patch.sh"))
//
//  os_disk {
//    caching              = "ReadWrite"
//    storage_account_type = "Standard_LRS"
//  }
//
//  admin_ssh_key {
//    username   = var.admin_username
//    public_key = file("id_rsa.pub")
//  }
//  source_image_reference {
//    publisher = "Canonical"
//    offer     = "UbuntuServer"
//    sku       = "16.04.0-LTS"
//    version   = "latest"
//  }
//
//  boot_diagnostics {
//    storage_account_uri = azurerm_storage_account.general_storage_account.primary_blob_endpoint
//  }
//
//  tags = merge({
//    Name = "test vm" },
//  local.common_tags)
//
//}
//
