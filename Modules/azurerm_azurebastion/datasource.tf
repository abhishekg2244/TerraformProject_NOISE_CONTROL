data "azurerm_subnet" "datasubnet" {
    for_each = var.bastions
    name = each.value.datasubnetbastion
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
  
}

data "azurerm_public_ip" "datapublic" {
  for_each = var.bastions
  name = each.value.datapublicipbastion
  resource_group_name = each.value.resource_group_name
  
}