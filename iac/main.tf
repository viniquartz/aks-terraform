module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  name_project        = var.name_project
  tags                = var.tags
}

module "ssh" {
  source            = "./modules/ssh"
  location          = var.location
  resource_group_id = module.rg.rg-aks-id
  tags              = var.tags
  depends_on        = [module.rg]
}

module "cluster-aks" {
  source              = "./modules/cluster-aks"
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = module.rg.rg-aks-name
  name_project        = var.name_project
  key_data            = module.ssh.key_data
  tags                = var.tags
  depends_on          = [module.rg, module.ssh]
}

module "acr" {
  source              = "./modules/acr"
  location            = var.location
  resource_group_name = module.rg.rg-aks-name
  kubelet_identity    = module.cluster-aks.kubelet_identity
  tags                = var.tags
  depends_on          = [module.rg, module.cluster-aks]
}