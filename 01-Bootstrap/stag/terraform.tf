# Declare the providers used
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.21.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.10.1"
    }
  }
  cloud {
    organization = "bookstore"

    workspaces {
      name = "Linode-k8s-clusters"
    }
  }
}