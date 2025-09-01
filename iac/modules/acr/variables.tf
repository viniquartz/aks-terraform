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
  description = "Tags to be used in all resources of the network module"
  default = {}
}

variable "kubelet_identity" {
  default = ""
}
