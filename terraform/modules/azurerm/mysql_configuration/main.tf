resource "azurerm_mysql_flexible_server_configuration" "mysql_configuration" {
  name                = "require_secure_transport"
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  value               = "OFF"
}
