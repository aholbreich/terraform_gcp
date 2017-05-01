# Work if creadentals are given by env varible.
# E.G. export GOOGLE_CREDENTIALS=$(cat ~/.gce/gce-terraform-key.json)
#
provider "google" {
  project     = "${var.gce_project}"
  region      = "${var.gce_region}"
}

resource "google_compute_address" "main_ip" {
  name = "http"
}

resource "google_sql_database_instance" "master" {
  name = "test-instance"
  region      = "${var.gce_region}"

  settings {
    tier = "db-f1-micro"
  }
}