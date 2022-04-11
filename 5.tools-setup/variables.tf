variable "email" {
  default = "farrukhsadykov@gmail.com"
}
variable "google_credentials_json" {
  default = "service-account.json"
}
variable "google_project_id" {
  description = "your project ID"
}
variable "grafana_username" {
  default = "admin"
}

variable "grafana_password" {
  default = "password"
}
variable "google_domain_name" {}