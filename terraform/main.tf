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
  snet_name  = "snet-ecommerce"
  rg_name    = module.rg.rg_name
  vnet_name  = module.vnet.vnet_name
}

module "mysql" {
  depends_on  = [module.snet]
  source      = "./modules/azurerm/mysql_flexible_server"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
  snet_id     = module.snet.snet_id
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

module "cr" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/container_registry"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}

module "aks" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/kubernetes_cluster"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}
module "sa" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/storage_account"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}

module "ss" {
  depends_on = [module.sa]
  source     = "./modules/azurerm/storage_share"
  sa_name    = module.sa.sa_name
}

module "cg" {
  depends_on  = [module.rg, module.sa, module.ss]
  source      = "./modules/azurerm/container_group"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
  ss_name     = module.ss.ss_name
  sa_name     = module.sa.sa_name
  sa_key      = module.sa.sa_key
}

module "rc" {
  depends_on  = [module.rg]
  source      = "./modules/azurerm/redis_cache"
  rg_name     = module.rg.rg_name
  rc_location = module.rg.rg_location
}

module "mysql_firewall" {
  depends_on = [module.mysql]
  source     = "./modules/azurerm/mysql_firewall"
  rg_name    = module.rg.rg_name
  mysql_name = module.mysql.mysql_name
}
module "mysql_configuration" {
  depends_on          = [module.mysql]
  source              = "./modules/azurerm/mysql_configuration"
  resource_group_name = module.rg.rg_name
  server_name         = module.mysql.mysql_name
}

module "helm" {
  depends_on = [module.aks]
  source     = "./modules/helm/release"
}
