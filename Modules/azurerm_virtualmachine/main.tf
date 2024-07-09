resource "azurerm_network_interface" "nicblock" {
    for_each = var.vms
    name = each.value.nic-name
    resource_group_name = each.value.resource_group_name
    location = each.value.location

    ip_configuration {
      name = "Internal"
      subnet_id = data.azurerm_subnet.datasubnet[each.key].id
      private_ip_address_allocation = "Dynamic"
    }
  
}

resource "azurerm_linux_virtual_machine" "vmblock" {
  for_each = var.vms
  name = each.value.vm-name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  size = "Standard_B1s"
  admin_username = data.azurerm_key_vault_secret.adminuserblock[each.key].value
  admin_password = data.azurerm_key_vault_secret.adminpwdblock[each.key].value
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nicblock[each.key].id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  
}