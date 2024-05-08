resource "azurerm_redis_cache" "rc" {
  name                = var.rc_name
  location            = var.rc_location
  resource_group_name = var.rg_name
  tags                = var.rc_tags
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  
  redis_configuration {}

}
