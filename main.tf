
variable "gce_project" {}
variable "gce_region" { default= "europe-west1"}
variable "gce_key_file" {default = "~/.gce/gce-terraform-key.json"}


provider "google" {
  credentials = "${file("${var.gce_key_file}")}"
  project     = "${var.gce_project}"
  region      = "${var.gce_region}"
}


resource "google_sql_database_instance" "master" {
  name = "test-instance"
  region      = "${var.gce_region}"

  settings {
    tier = "db-f1-micro"
  }
}