rgs = {
    rg1 ={
        rgname = "preprod_noise_rg001"
        location = "east us 2"
    }
}

vnets = {
    vnet1 ={
        name = "preprod_noise_vnet"
        resource_group_name = "preprod_noise_rg001"
        location = "east us 2"
        address_space = ["10.0.0.0/16"]
    }
}

subnets = {
    subnet1= {
     name = "frontend-subnet"
     virtual_network_name = "preprod_noise_vnet"
     resource_group_name = "preprod_noise_rg001"
     address_prefixes = ["10.0.1.0/24"]
    }
     subnet2= {
     name = "Backend-subnet"
     virtual_network_name = "preprod_noise_vnet"
     resource_group_name = "preprod_noise_rg001"
     address_prefixes = ["10.0.2.0/24"]
    }
     subnet3= {
     name = "AzureBastionSubnet"
     virtual_network_name = "preprod_noise_vnet"
     resource_group_name = "preprod_noise_rg001"
     address_prefixes = ["10.0.3.0/26"]
    }
}

vms = {
     vm1 = {
      nic-name             = "frontendvm1-nic"
      vm-name              = "frontendvm1"
      resource_group_name  = "preprod_noise_rg001"
      location             = "east us 2" 
      virtual_network_name = "preprod_noise_vnet"
      datasubnet           = "frontend-subnet"
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
      datakeyvault         = "Abhishekkeyvault2244"
      
     }
     vm2 = {
      nic-name             = "frontendvm2-nic"
      vm-name              = "frontendvm2"
      resource_group_name  = "preprod_noise_rg001"
      location             = "east us 2" 
      virtual_network_name = "preprod_noise_vnet"
      datasubnet           = "frontend-subnet"
      publisher            = "Canonical"
      offer                = "0001-com-ubuntu-server-jammy"
      sku                  = "22_04-lts"
      version              = "latest"
      datakeyvault         = "Abhishekkeyvault2244"
      
     }
}

pips = {
    pip1 ={
    name= "jumpserverpip"
    resource_group_name = "preprod_noise_rg001"
    location = "east us 2"
    allocation_method = "Static"
    sku =  "Standard"  
    }
     pip2 ={
     name = "gatewaypip"
     resource_group_name = "preprod_noise_rg001"
     location = "east us 2"
     allocation_method = "Static"
     sku =  "Standard"  
    }
}

bastions = {
    bastion1={
        name = "jumpbox"
        resource_group_name = "preprod_noise_rg001"
        location            = "east us 2"
        datasubnetbastion = "AzureBastionSubnet"
        datapublicipbastion = "jumpserverpip"
        virtual_network_name = "preprod_noise_vnet"
    }
}