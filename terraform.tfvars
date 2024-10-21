resource_group_name = "Lab01_rg"
location            = "eastus"


virtual_network_variable = {
  vnet01 = {
    name          = "Lab01_Vnet"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_variable = {
  "subnet01" = {
    virtual_network_name = "Lab01_Vnet"
    name                 = "Web_Server_Subnet"
    address_prefixes     = ["10.0.1.0/24"]
  },
  "subnet02" = {
    virtual_network_name = "Lab01_Vnet"
    name                 = "Database_Server_Subnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

network_interface_variable = {
  "nic01" = {
    subnet_name          = "Web_Server_Subnet"
    virtual_network_name = "Lab01_Vnet"
    name                 = "Lab01_NIC"
    ip_config_name       = "ip_config"
    ip_allocation        = "Dynamic"
  }
}

virtual_machine_variable = {
  "vm01" = {
    nic_name             = "Lab01_NIC"
    name                 = "Lab01_VM"
    size                 = "Standard_F2"
    admin_username       = "username01"
    admin_password       = "helloword1234!"
    computer_name     =     "computername"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "MicrosoftWindowsServer"
    offer                = "WindowsServer"
    sku                  = "2016-Datacenter"
    version              = "latest"
  }
}

