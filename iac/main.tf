module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  name_project        = var.name_project
  tags                = local.tags
}

module "network-hub" {
  source              = "./modules/network-hub"
  resource_group_name = module.rg.rg-management-name
  location            = var.location
  name_project        = var.name_project
  tags                = local.tags
  depends_on          = [module.rg]
}

# module "network-spoke-aks" {
#   source              = "./modules/network-spoke-aks"
#   resource_group_name = module.rg.rg-aks-name
#   location            = var.location
#   tags                = local.tags
# }

module "ssh" {
  source            = "./modules/ssh"
  location          = var.location
  resource_group_id = module.rg.rg-aks-id
  tags              = local.tags
  depends_on        = [module.rg]
}

module "cluster-aks" {
  source              = "./modules/cluster-aks"
  location            = var.location
  resource_group_name = module.rg.rg-aks-name
  name_project        = var.name_project
  key_data            = module.ssh.key_data
  depends_on          = [module.rg, module.ssh]
}
