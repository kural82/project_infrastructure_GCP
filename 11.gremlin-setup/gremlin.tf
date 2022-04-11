module "gremlin-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "gremlin"
}

module "gremlin-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "gremlin"
  deployment_namespace = "gremlin"
  deployment_path      = "charts/gremlin/"
  values_yaml          = <<EOF
gremlin:
  secret:
    managed: true
    type: secret
    teamID: 9754c027-8843-4581-94c0-278843d581d6 
    clusterID: "project-cluster"
    teamSecret: "70d046f9-7105-41d8-9046-f9710581d8ff" 
EOF
}