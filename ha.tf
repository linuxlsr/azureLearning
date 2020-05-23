//# the goal is to create a vm based high availability deployment of nginx that uses a load balancer with a public end point and no public IPs on the VMs.
//
//#PIP
//resource "random_string" "fqdn" {
//  length  = 6
//  special = false
//  upper   = false
//  number  = false
//}
//
//resource "azurerm_public_ip" "lb_pip" {
//  allocation_method   = "Dynamic"
//  location            = var.location
//  name                = "lb-pip"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  domain_name_label   = random_string.fqdn.result
//  tags                = merge({ Name = "lb pip" }, local.common_tags)
//}
//
//# load balancer
//resource "azurerm_lb" "first_lb" {
//  name                = "first-lb"
//  location            = var.location
//  resource_group_name = azurerm_resource_group.first_rg.name
//  frontend_ip_configuration {
//    name                 = "PublicIpAddress"
//    public_ip_address_id = azurerm_public_ip.lb_pip.id
//  }
//  tags = merge({ Name = "first lb" }, local.common_tags)
//}
//
//resource "azurerm_lb_backend_address_pool" "lb_be_pool" {
//  loadbalancer_id     = azurerm_lb.first_lb.id
//  name                = "lbbackendpool"
//  resource_group_name = azurerm_resource_group.first_rg.name
//}
//#health check
//resource "azurerm_lb_probe" "lb_probe" {
//  loadbalancer_id     = azurerm_lb.first_lb.id
//  name                = "firstlbprobe"
//  port                = 80
//  resource_group_name = azurerm_resource_group.first_rg.name
//}
//
//# listener
//resource "azurerm_lb_rule" "lb_nat_rule" {
//  resource_group_name            = azurerm_resource_group.first_rg.name
//  loadbalancer_id                = azurerm_lb.first_lb.id
//  name                           = "http"
//  protocol                       = "Tcp"
//  frontend_port                  = 80
//  backend_port                   = 80
//  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb_be_pool.id
//  frontend_ip_configuration_name = "PublicIpAddress"
//  probe_id                       = azurerm_lb_probe.lb_probe.id
//}
//# scaleset
//resource "azurerm_virtual_machine_scale_set" "lb_scale_set" {
//  location            = var.location
//  name                = "firstscaleset"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  upgrade_policy_mode = "Manual"
//  network_profile {
//    name    = "scalesetnetprofile"
//    primary = true
//    ip_configuration {
//      name                                   = "IPConfiguration"
//      primary                                = true
//      subnet_id                              = module.network.vnet_subnets[0]
//      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_be_pool.id]
//    }
//  }
//
//  os_profile {
//    admin_username       = var.admin_username
//    #admin_password       = "NotUsed"
//    computer_name_prefix = "testhalinuxlsr1"
//    custom_data          = base64encode(file("scripts/linux_vm_patch.sh"))
//  }
//
//  storage_profile_image_reference {
//    publisher = "Canonical"
//    offer     = "UbuntuServer"
//    sku       = "16.04-LTS"
//    version   = "latest"
//  }
//
//  os_profile_linux_config {
//    disable_password_authentication = true
//
//    ssh_keys {
//      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
//      key_data = file("/home/azureLearning/id_rsa.pub")
//    }
//  }
//
//  sku {
//    capacity = 2
//    tier     = "Standard"
//    name     = var.vmsize
//  }
//
//  storage_profile_os_disk {
//    #name              = "storageprofileosdisklinuxlsr"
//    caching           = "ReadWrite"
//    create_option     = "FromImage"
//    managed_disk_type = "Standard_LRS"
//  }
//
//  storage_profile_data_disk {
//    create_option = "Empty"
//    lun = 0
//    caching = "ReadWrite"
//    disk_size_gb = 10
//  }
//}
//
//# availability set. Use from vm module
//#var = module.linux_vm.availability_set_id
