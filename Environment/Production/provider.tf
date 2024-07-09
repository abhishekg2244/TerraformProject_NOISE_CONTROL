terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.111.0"
    }
  }
  backend "azurerm" {
 
    resource_group_name = "Abhishek_RG_donot_delete"
    storage_account_name = "tfstorageabhi2424"
    container_name = "homelockcontainer"
    key = "prod_noise_tfstate"
    
  }
}

provider "azurerm" {
  features {
    
  }
}