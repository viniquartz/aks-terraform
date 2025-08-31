resource "azurerm_network_security_group" "hub-sg" {
  name                = "${var.name_project}hubsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "management-association-sg-subnet" {
  subnet_id                 = azurerm_subnet.subnet-management.id
  network_security_group_id = azurerm_network_security_group.hub-sg.id
}