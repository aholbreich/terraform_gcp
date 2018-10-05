variable "kube_user" {}
variable "kube_pass" {}
variable "gce_default_zone" {}

## Additional node pool
resource "google_container_node_pool" "standard1" {
  name       = "standard1-pool"
  zone       = "${var.gce_default_zone}"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 0

  node_config {
    #  preemptible  = true
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
    ]
  }
}



resource "google_container_cluster" "primary" {
  name = "first"
  zone = "${var.gce_default_zone}"

  initial_node_count = 1

  master_auth {
    username = "${var.kube_user}"
    password = "${var.kube_pass}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
