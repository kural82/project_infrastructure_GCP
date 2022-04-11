module "kube-state-metrics-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "kube-state-metrics"
}

module "kube-state-metrics-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "kube-state-metrics"
  deployment_namespace = "kube-state-metrics"
  deployment_path      = "charts/kube-state-metrics/"
  values_yaml          = ""
}

