resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = "k8s-python-api"
  region  = var.region
  version = "1.25.4-do.0"
  tags    = ["terraform", "k8s"]

  node_pool {
    name       = "k8s-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}

resource "local_file" "name" {
  content  = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
  filename = "kube_config.yaml"
}
