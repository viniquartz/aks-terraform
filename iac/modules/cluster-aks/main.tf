resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.location
  name                = "${var.cluster_name}-${var.name_project}"
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}${var.name_project}vini"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "standard_b2s"
    node_count = 2
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
  tags = var.tags
}