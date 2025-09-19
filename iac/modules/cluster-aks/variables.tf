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