terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.77.0"
    }
  }
}


provider "azurerm" {
  #version = "=2.52.0"
  features {}
}

