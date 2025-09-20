variable "resource_group_name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "name_project" {
  default = ""
}

variable "tags" {
  type        = map(string)
}

variable "vnet-spoke-id" {
  default = ""
}

variable "acr-id" {
  default = ""
}

variable "spoke-subnet-appgateway" {
  default = ""
}

variable "key_data" {
  default = ""
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "vnet_aks_subnet_id" {
  type = string
}

variable "user_assigned_identity_id" {
  type = string
}

variable "law_id" {
  type = string
}

variable "aad_admin_group_ids" {
  type = list(string)
}

variable "k8s_version" {
  type = string
  default = "1.27.6"
}