data "azurerm_subnet" "datasubnet" {
    for_each = var.vms
    name = each.value.datasubnet
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
  
}

data "azurerm_key_vault" "keyvalutblock" {
  for_each = var.vms
  name = each.value.datakeyvault
  resource_group_name = "Abhishek_RG_donot_delete"

}

data "azurerm_key_vault_secret" "adminuserblock" {
    for_each = var.vms
  key_vault_id = data.azurerm_key_vault.keyvalutblock[each.key].id
  name = "vmadmin"
  
}
data "azurerm_key_vault_secret" "adminpwdblock" {
    for_each = var.vms
  key_vault_id = data.azurerm_key_vault.keyvalutblock[each.key].id
  name = "vmpassword"
 
}