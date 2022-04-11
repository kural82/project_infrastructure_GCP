module "cert-mananger-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "cert-manager"
  deployment_namespace = "cert-manager"
  deployment_path      = "charts/cert-manager/"
  values_yaml          = <<EOF
podDnsPolicy: "None"
podDnsConfig:
  nameservers:
    - "8.8.4.4"
    - "8.8.8.8"
installCRDs: true
EOF
}

module "letsencrypt-issuer-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "letsencrypt-issuer"
  deployment_namespace = "cert-manager"
  deployment_path      = "charts/letsencrypt-issuer/"
  values_yaml          = <<EOF
email: "${var.email}"
type: prod
EOF
}
