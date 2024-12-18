output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "web_nsg_id" {
  value = azurerm_network_security_group.web_nsg.id
}