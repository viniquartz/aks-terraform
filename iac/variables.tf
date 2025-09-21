variable "resource_group_name" {
  default = "rg-viniquartz"
}

variable "location" {
  default = "eastus2"
}

variable "name_project" {
  default = "lab001"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to all resources"
  type        = map(string)
}

variable "k8s_version" {
  type    = string
  default = "1.27.6"
}

variable "aad_admin_group_ids" {
  type    = list(string)
  default = ["46b4f795-5c32-49f7-bd10-6fbf1788cd35"]
}