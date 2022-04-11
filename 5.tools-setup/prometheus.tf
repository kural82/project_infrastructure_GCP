module "prometheus-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "prometheus"
}

module "prometheus-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "prometheus"
  deployment_namespace = "prometheus"
  deployment_path      = "charts/prometheus/"
  values_yaml          = <<-EOF
alertmanager:
  ingress:
    enabled: true
    annotations: 
      ingress.kubernetes.io/ssl-redirect: "false"
      kubernetes.io/ingress.class: nginx
      cert-manager.io/cluster-issuer: letsencrypt-prod
      acme.cert-manager.io/http01-edit-in-place: "true"
    hosts: 
      - "alertmanager.${var.google_domain_name}"
    tls: 
      - secretName: alertmanager
        hosts:
          - "alertmanager.${var.google_domain_name}"

server:
  enabled: true
  ingress:
    enabled: true
    annotations:
      ingress.kubernetes.io/ssl-redirect: "false"
      kubernetes.io/ingress.class: nginx
      cert-manager.io/cluster-issuer: letsencrypt-prod
      acme.cert-manager.io/http01-edit-in-place: "true"
    hosts: 
      - "prometheus.${var.google_domain_name}"
    tls: 
      - secretName: prometheus-server-tls
        hosts:
          - "prometheus.${var.google_domain_name}"

  EOF
}

