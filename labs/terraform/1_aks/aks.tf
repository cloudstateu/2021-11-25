resource "azurerm_kubernetes_cluster" "k8s" {
  name       = "${var.prefix}-aks"
  location   = azurerm_resource_group.aks.location
  dns_prefix = var.aks_dns_prefix

  resource_group_name = azurerm_resource_group.aks.name

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
  }

  default_node_pool {
    name            = "agentpool"
    node_count      = var.aks_agent_count
    vm_size         = var.aks_agent_vm_size
    os_disk_size_gb = var.aks_agent_os_disk_size
    vnet_subnet_id  = azurerm_subnet.kubesubnet.id
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  tags       = var.tags
}



# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "k8s_access_to_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}