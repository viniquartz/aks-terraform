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
  type = string
}