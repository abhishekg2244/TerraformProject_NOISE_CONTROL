module "RG" {
  source = "../../Modules/azurem_resource_group"
  rgs = var.rgs
}
module "vnet" {
    depends_on = [ module.RG ]
  source = "../../Modules/azurerm_virtual_network"
  vnets = var.vnets
}

module "subnet" {
  depends_on = [ module.RG,module.vnet ]
  source = "../../Modules/azurerm_subnet"
  subnets = var.subnets
}

module "vm" {
  depends_on = [ module.RG,module.vnet,module.subnet ]
  source = "../../Modules/azurerm_virtualmachine"
  vms = var.vms
}

module "publicip" {
  depends_on = [ module.RG ]
  source = "../../Modules/azurerm_publicip"
  pips = var.pips
}

module "Azurebastion" {
  depends_on = [module.RG,module.vnet,module.subnet,module.publicip ]
  source = "../../Modules/azurerm_azurebastion"
  bastions = var.bastions
}