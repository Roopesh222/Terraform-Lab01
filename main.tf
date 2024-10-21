provider "azurerm" {
  features {
  }
  subscription_id = "e5d1bf06-2bcf-4e00-8726-642d749c8d04"
}

module "rg_module" {
  source              = "./modules/Resource_Group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet_module" {
  source                   = "./modules/Virtual_Network"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  virtual_network_variable = var.virtual_network_variable
  depends_on               = [module.rg_module]
}

######################### SUBNET ####################
module "subnet_module" {
  source              = "./modules/Subnets"
  resource_group_name = var.resource_group_name
  subnet_variable     = var.subnet_variable
  depends_on          = [module.vnet_module]
}

###################### NIC ##########################
module "nic_card" {
  source                     = "./modules/NIC"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  network_interface_variable = var.network_interface_variable
  depends_on                 = [module.subnet_module, module.rg_module]
}

################## Virtual Machine ###################
module "virtual_machine" {
  source                   = "./modules/Virtual_Machine"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  virtual_machine_variable = var.virtual_machine_variable
  depends_on              = [module.rg_module, module.subnet_module, module.nic_card]
}