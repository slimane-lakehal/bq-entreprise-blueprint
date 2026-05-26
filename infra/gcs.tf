resource "google_storage_bucket" "raw_data" {
  name                        = "lumio-raw-data-dev"
  location                    = var.region
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition { age = 90 }
    action { type = "Delete" }
  }
}
