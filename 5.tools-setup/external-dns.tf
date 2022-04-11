module "external-dns-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "external-dns-deployment"
  deployment_namespace = "external-dns"
  deployment_path      = "charts/external-dns"
  values_yaml          = <<EOF
provider: google
google:
  project: "${var.google_project_id}"
  serviceAccountSecret: "google-service-account" 
EOF
}

resource "kubernetes_secret" "external_dns_secret" {
  metadata {
    name      = "google-service-account"
    namespace = "external-dns"
  }
  data = {
    "credentials.json" = "${file("${var.google_credentials_json}")}"
  }
  type = "generic"
}
