provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_namespace" "example" {
  metadata {
    annotations = var.annotations
    labels      = var.labels
    name        = var.name
  }
}