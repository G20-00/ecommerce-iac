resource "azurerm_mysql_flexible_server_firewall_rule" "mysql_firewall" {
  name                = "allow_all_ips"
  resource_group_name = var.rg_name
  server_name         = var.mysql_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
