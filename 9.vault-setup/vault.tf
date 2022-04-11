module "vault-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "vault"
}

module "vault-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "vault"
  deployment_namespace = "vault"
  deployment_path      = "charts/vault/"
  values_yaml          = <<EOF
server:  
  ingress:
    enabled: true
    annotations: 
      nginx.ingress.kubernetes.io/proxy-body-size: "0"
      ingress.kubernetes.io/ssl-redirect: "false"
      cert-manager.io/cluster-issuer: letsencrypt-prod
      acme.cert-manager.io/http01-edit-in-place: "true"
    ingressClassName: "nginx"
    hosts:
    - host: "vault.${var.google_domain_name}"
      http:
        paths:
        - pathType: Prefix
          path: "/"
          backend:
            service:
              name: vault
              port:
                number: 8200
      
    tls: 
      - secretName: vault
        hosts:
          - "vault.${var.google_domain_name}"
  EOF
}

