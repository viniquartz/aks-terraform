resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}-${var.name_project}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}${var.name_project}vini"

  identity {
    type = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  azure_active_directory_role_based_access_control {
    managed = true
    azure_rbac_enabled = true
    admin_group_object_ids = var.aad_admin_group_ids
  }

  // Pool de nós principal com autoescalonamento
  default_node_pool {
    name                  = "systempool"
    vm_size               = "standard_b2s"
    enable_auto_scaling   = true
    min_count             = 1
    max_count             = 3
    node_labels           = { "nodepool-type" = "system" }
    type                  = "VirtualMachineScaleSets"
    vnet_subnet_id        = var.vnet_aks_subnet_id
  }

  network_profile {
    network_plugin      = "azure"
    network_policy      = "calico"
    load_balancer_sku   = "standard"
    outbound_type       = "loadBalancer"
  }
  oms_agent {
    log_analytics_workspace_id = var.law_id
  }
  
  azure_policy_enabled = true
  kubernetes_version = var.k8s_version

  tags = var.tags
}
