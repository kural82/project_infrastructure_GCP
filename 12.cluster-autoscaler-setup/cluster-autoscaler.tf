module "cluster-autoscaler-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "cluster-autoscaler"
}

module "cluster-autoscaler-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "cluster-autoscaler"
  deployment_namespace = "cluster-autoscaler"
  deployment_path      = "charts/cluster-autoscaler/"
  values_yaml          = <<EOF
EOF
}