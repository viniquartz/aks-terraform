module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  name_project        = var.name_project
  tags                = var.tags
}

module "network-spoke-aks" {
  source              = "./modules/network-spoke-aks"
  resource_group_name = module.rg.rg-aks-name
  location            = var.location
  name_project        = var.name_project
  tags                = var.tags
  depends_on          = [module.rg]
}

module "identity" {
  source              = "./modules/identity"
  resource_group_name = module.rg.rg-aks-name
  location            = var.location
  name_project        = var.name_project
  tags                = var.tags
  depends_on          = [module.rg]
}

module "log_analytics" {
  source              = "./modules/log-analytics"
  resource_group_name = module.rg.rg-aks-name
  location            = var.location
  name_project        = var.name_project
  tags                = var.tags
  depends_on          = [module.rg]
}

module "aad" {
  source     = "./modules/aad"
  depends_on = [module.rg]
}

module "cluster-aks" {
  source                    = "./modules/cluster-aks"
  cluster_name              = var.cluster_name
  location                  = var.location
  resource_group_name       = module.rg.rg-aks-name
  name_project              = var.name_project
  vnet_aks_subnet_id        = module.network-spoke-aks.vnet_aks_subnet_id
  user_assigned_identity_id = module.identity.aks_identity_id
  law_id                    = module.log_analytics.law_id
  aad_admin_group_ids       = module.aad.aks_admins_group
  k8s_version               = var.k8s_version
  tags                      = var.tags
  depends_on                = [module.rg, module.network-spoke-aks, module.identity, module.log_analytics, module.aad]
}

module "acr" {
  source              = "./modules/acr"
  location            = var.location
  resource_group_name = module.rg.rg-aks-name
  kubelet_identity    = module.cluster-aks.kubelet_identity
  tags                = var.tags
  depends_on          = [module.rg, module.cluster-aks]
}