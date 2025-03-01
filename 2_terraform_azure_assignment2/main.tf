terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "tfbackendstorage987654"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# ==============================================================================================

provider "azurerm" {
  features {}

  subscription_id = "4265c93e-7f2c-4188-ac9e-785a24935e1f"
}

# ==============================================================================================

resource "azurerm_resource_group" "rg_backend" {
  name     = "terraform-backend-rg"
  location = "West US"
}

resource "azurerm_storage_account" "sa_backend" {
  name                     = "tfbackendstorage987654"
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
}

resource "azurerm_resource_group" "example" {
  name     = "test-resources"
  location = "West US"
}

# ==============================================================================================
## Here is the configuration about AKS Cluster and ACR
# ==============================================================================================

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.rg_backend.location  
  resource_group_name = azurerm_resource_group.rg_backend.name
  dns_prefix          = "myaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_container_registry.acr]
}

resource "azurerm_container_registry" "acr" {
  name                = "reisacr25"  
  resource_group_name = azurerm_resource_group.rg_backend.name
  location            = azurerm_resource_group.rg_backend.location
  sku                 = "Basic"
  admin_enabled       = true
}


resource "azurerm_role_assignment" "aks_acr" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
