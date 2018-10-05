variable "gce_project" {}  
variable "gce_region" { default= "europe-west1"}


provider "google" {
  project     = "${var.gce_project}"
  region      = "${var.gce_region}"
}

terraform {  
  backend "gcs" {
    bucket  = "org_holbreich"
    path    = "terraform"
    project = "main"
  }
}