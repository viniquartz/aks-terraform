# VNET
output "vnet-spoke-aks-name" {
  value = azurerm_virtual_network.vnet-spoke-aks.name
}

output "vnet-spoke-aks-id" {
  value = azurerm_virtual_network.vnet-spoke-aks.id
}

# SG
output "vnet-spoke-aks-sg-name" {
  value = azurerm_network_security_group.spoke-aks-sg.name
}

output "vnet-spoke-aks-sg-id" {
  value = azurerm_network_security_group.spoke-aks-sg.id
}

# SUBNETS
output "vnet-spoke-aks-subnet-nodes-name" {
  value = azurerm_subnet.subnet-nodes.name
}

output "vnet-spoke-aks-subnet-nodes-id" {
  value = azurerm_subnet.subnet-nodes.id
}

output "vnet-spoke-aks-subnet-privatelink-name" {
  value = azurerm_subnet.subnet-privatelink.name
}

output "vnet-spoke-aks-subnet-privatelink-id" {
  value = azurerm_subnet.subnet-privatelink.id
}

output "vnet-spoke-aks-subnet-ingress-name" {
  value = azurerm_subnet.subnet-ingress.name
}

output "vnet-spoke-aks-subnet-ingress-id" {
  value = azurerm_subnet.subnet-ingress.id
}

output "vnet-spoke-aks-subnet-appgateway-name" {
  value = azurerm_subnet.subnet-appgateway.name
}

output "vnet-spoke-aks-subnet-appgateway-id" {
  value = azurerm_subnet.subnet-appgateway.id
}