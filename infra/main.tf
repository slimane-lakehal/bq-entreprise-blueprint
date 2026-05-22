terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

# GCS bucket for raw data
resource "google_storage_bucket" "raw_data" {
  name     = "lumio-raw-data-dev"
  location = var.region
}

# BigQuery datasets
resource "google_bigquery_dataset" "raw_cegid" {
  dataset_id = "raw_cegid"
  location   = var.region
}

resource "google_bigquery_dataset" "stg_cegid" {
  dataset_id = "stg_cegid"
  location   = var.region
}
