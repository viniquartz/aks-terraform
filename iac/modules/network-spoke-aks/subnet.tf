resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.name_project}-vnet-spoke-subnet-aks"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-spoke-aks.name
  address_prefixes     = ["10.2.0.0/24"]

  # delegation {
  #   name = "aks_delegation"
  #   service_delegation {
  #     name = "Microsoft.ContainerService/managedClusters"
  #     actions = [
  #       "Microsoft.Network/virtualNetworks/subnets/join/action"
  #     ]
  #   }
  # }
}



# resource "azurerm_subnet" "subnet-nodes" {
#   name                 = "${var.name_project}-vnet-spoke-subnet-nodes"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet-spoke-aks.name
#   address_prefixes     = ["10.1.0.0/22"]
# }

# resource "azurerm_subnet" "subnet-privatelink" {
#   name                 = "${var.name_project}-vnet-spoke-subnet-privatelink"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet-spoke-aks.name
#   address_prefixes     = ["10.1.4.0/24"]
# }

# resource "azurerm_subnet" "subnet-ingress" {
#   name                 = "${var.name_project}-vnet-spoke-subnet-ingress"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet-spoke-aks.name
#   address_prefixes     = ["10.1.5.0/24"]
# }

# resource "azurerm_subnet" "subnet-appgateway" {
#   name                 = "${var.name_project}-vnet-spoke-subnet-appgateway"
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet-spoke-aks.name
#   address_prefixes     = ["10.1.6.0/24"]
# }