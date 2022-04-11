module "grafana-terraform-helm" {
  source               = "./modules/terraform-helm/"
  deployment_name      = "grafana"
  deployment_namespace = "grafana"
  deployment_path      = "charts/grafana/"
  values_yaml          = <<EOF
dashboardProviders: 
 dashboardproviders.yaml:
   apiVersion: 1
   providers:
   - name: 'default'
     orgId: 1
     folder: ''
     type: file
     disableDeletion: false
     editable: true
     options:
       path: /var/lib/grafana/dashboards/default
dashboards: 
  default:
    kubernetes-apiserver:
      file: dashboards/kubernetes-apiserver.json
    kubernetes-monitoring:
      file: dashboards/kubernetes-monitoring.json     
    kubernetes-nodes:
      file: dashboards/kubernetes-nodes.json
    kubernetes-volume:
      file: dashboards/kubernetes-volume.json
    kubernetes-pod-overview:
      file: dashboards/kubernetes-pod-overview.json
ingress:
  enabled: true
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-prod
    acme.cert-manager.io/http01-edit-in-place: "true"
  path: /
  hosts:
    - "grafana.${var.google_domain_name}"
  tls:
    - secretName: grafana-tls
      hosts:
        - "grafana.${var.google_domain_name}"
persistence:
  type: pvc
  enabled: true
adminUser: "${var.grafana_username}"
adminPassword: "${var.grafana_password}"
datasources:
 datasources.yaml:
   apiVersion: 1
   datasources:
   - name: Prometheus
     type: prometheus
     url: http://prometheus-server.prometheus.svc.cluster.local:80
     access: proxy
     isDefault: true
EOF
}
