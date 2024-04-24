terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "cybertron-420601" # this is from my key
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "cybertron-420601-86f3624bc78f.json"
}


resource "google_storage_bucket" "auto-expire" {
  name          = "greenvilleman001001"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}