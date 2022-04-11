module "gke" {
  source = "./module/"
  gke_config = {
    region         = "us-central1"
    zone           = "us-central1-c"
    cluster_name   = "project-cluster"
    machine_type   = "e2-medium"
    node_count     = 1
    node_pool_name = "my-node-pool"
    preemptible    = true
    node_version   = "1.21" # finds build version automatically based on region. We can change it to 1.21   . In this case it will automatically find minor version
  }
}