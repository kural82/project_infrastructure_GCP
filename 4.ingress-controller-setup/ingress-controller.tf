module "ingress-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "ingress"
}

module "ingress-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "ingress"
  deployment_namespace = "ingress"
  deployment_path      = "charts/nginx-ingress/"
  values_yaml          = <<EOF
controller:
  service:
    create: true
    type: LoadBalancer
    loadBalancerSourceRanges: 
      ${var.loadBalancerSourceRanges[0]}
      ${var.loadBalancerSourceRanges[1]}
      ${var.loadBalancerSourceRanges[2]}
      ${var.loadBalancerSourceRanges[3]}
      ${var.loadBalancerSourceRanges[4]}
      ${var.loadBalancerSourceRanges[5]}
      ${var.loadBalancerSourceRanges[6]}
      ${var.loadBalancerSourceRanges[7]}
      ${var.loadBalancerSourceRanges[8]}
      ${var.loadBalancerSourceRanges[9]}
  EOF
}