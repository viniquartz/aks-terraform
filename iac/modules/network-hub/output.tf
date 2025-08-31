output "vnet-hub-name" {
  value = azurerm_virtual_network.vnet-hub.name
}

output "vnet-hub-id" {
  value = azurerm_virtual_network.vnet-hub.id
}

output "vnet-hub-subnet_-anagement_-ame" {
  value = azurerm_subnet.subnet-management.name
}

output "vnet_hub_subnet_management_id" {
  value = azurerm_subnet.subnet-management.id
}

output "vnet_hub_sg_name" {
  value = azurerm_network_security_group.hub-sg.name
}

output "vnet_hub_sg_id" {
  value = azurerm_network_security_group.hub-sg.id
}