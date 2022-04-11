module "jenkins-terraform-k8s-namespace" {
  source               = "./modules/terraform-k8s-namespace/"
  deployment_namespace = "jenkins"
}

module "jenkins-terraform-helm" {
  depends_on = [
    kubernetes_persistent_volume_claim.example
  ]
  source               = "./modules/terraform-helm/"
  deployment_name      = "jenkins"
  deployment_namespace = "jenkins"
  deployment_path      = "charts/jenkins/"
  values_yaml          = <<EOF
controller:
  image: "jenkins/jenkins"
  tag: "2.337-jdk11"
  ingress:
    enabled: yes
    apiVersion: "extensions/v1beta1"
    annotations:
      kubernetes.io/ingress.class: nginx
      ingress.kubernetes.io/ssl-redirect: "false"
      cert-manager.io/cluster-issuer: letsencrypt-prod
      acme.cert-manager.io/http01-edit-in-place: "true"
    hostName: "jenkins.${var.google_domain_name}"
    tls:
      - secretName: jenkins
        hosts:
          - "jenkins.${var.google_domain_name}"

persistence:
  existingClaim: "${var.jenkins_extra_volume}"
EOF
}

resource "kubernetes_persistent_volume_claim" "example" {
  metadata {
    name      = var.jenkins_extra_volume
    namespace = "jenkins"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "15Gi"
      }
    }
    storage_class_name = "standard"
  }
}
output "jenkins_password" {
  value = <<-EOF

                Please run below command 

                    Username: admin

                    Password: Please run below command
                        printf $(kubectl get secret --namespace jenkins jenkins -o jsonpath='{.data.jenkins-admin-password}' | base64 --decode);echo
  EOF
}