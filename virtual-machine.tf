# an EC2 instance
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
//
//
//resource "azurerm_network_interface" "test_vm_nic" {
//  location            = var.location
//  name                = "${var.application}_${var.environment}_test_nic"
//  resource_group_name = azurerm_resource_group.first_rg.name
//  ip_configuration {
//    name                          = "${var.application}_${var.environment}_test_ip"
//    private_ip_address_allocation = "Dynamic"
//    subnet_id                     = azurerm_subnet.subnet_1.id
//    public_ip_address_id          = azurerm_public_ip.vm_ip.id
//  }
//  tags = merge({
//    Name = "test vm nic" },
//  local.common_tags)
//}