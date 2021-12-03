variable "prefix" {
  default = "CHANGME"
  description = "Only lowercase letters and numbers"
}

variable "location" {
  default="westeurope"
}

variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = "10.1.0.0/16"
}

variable "aks_subnet_address_prefix" {
  description = "Subnet address prefix."
  default     = "10.1.0.0/20"
}

variable "vnet_name" {
  default = "vnet"
}

variable "rg_aks_name" {
  default = "aks"
}


variable "aks_dns_prefix" {
  description = "Optional DNS prefix to use with hosted Kubernetes API server FQDN."
  default     = "aks"
}

variable "aks_agent_os_disk_size" {
  description = "Disk size (in GB) to provision for each of the agent pool nodes. This value ranges from 0 to 1023. Specifying 0 applies the default disk size for that agentVMSize."
  default     = 32
}

variable "aks_agent_count" {
  description = "The number of agent nodes for the cluster."
  default     = 1
}

variable "aks_agent_vm_size" {
  description = "VM size"
  default     = "Standard_B2ms"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.19.9"
}


variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}