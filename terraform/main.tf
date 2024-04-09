module "rg" {
  source = "./modules/azurerm/resource_group"
}

module "vnet" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/virtual_network"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}

module "snet" {
  depends_on = [module.rg, module.vnet]
  source     = "./modules/azurerm/subnet"
  rg_name    = module.rg.rg_name
  vnet_name  = module.vnet.vnet_name
}

module "ni" {
  depends_on  = [module.rg, module.snet]
  source      = "./modules/azurerm/network_interface"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
  sn_id       = module.snet.snet_id
}

module "nsg" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/network_security_group"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}

module "nisga" {
  depends_on = [module.ni, module.nsg]
  source     = "./modules/azurerm/network_interface_security_group_association"
  ni_id      = module.ni.ni_id
  nsg_id     = module.nsg.nsg_id
}

module "aks" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/kubernetes_cluster"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}
