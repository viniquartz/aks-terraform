# resource "azurerm_network_security_group" "spoke-aks-sg" {
#   name                = "${var.name_project}-spoke-aks-sg"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   tags = var.tags
# }

# resource "azurerm_subnet_network_security_group_association" "nodes-association-sg-subnet" {
#   subnet_id                 = azurerm_subnet.subnet-nodes.id
#   network_security_group_id = azurerm_network_security_group.spoke-aks-sg.id
# }

# resource "azurerm_subnet_network_security_group_association" "privatelink-association-sg-subnet" {
#   subnet_id                 = azurerm_subnet.subnet-privatelink.id
#   network_security_group_id = azurerm_network_security_group.spoke-aks-sg.id
# }

# resource "azurerm_subnet_network_security_group_association" "ingress-association-sg-subnet" {
#   subnet_id                 = azurerm_subnet.subnet-ingress.id
#   network_security_group_id = azurerm_network_security_group.spoke-aks-sg.id
# }

# resource "azurerm_subnet_network_security_group_association" "appgateway-association-sg-subnet" {
#   subnet_id                 = azurerm_subnet.subnet-appgateway.id
#   network_security_group_id = azurerm_network_security_group.spoke-aks-sg.id
# }