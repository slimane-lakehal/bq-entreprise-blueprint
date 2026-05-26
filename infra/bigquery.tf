# Raw landing datasets — one per source system, loaded by Python ingestion jobs
resource "google_bigquery_dataset" "raw_cegid" {
  dataset_id  = "raw_cegid"
  description = "Raw Cegid POS transactions (Olist dataset)"
  location    = var.region
}

resource "google_bigquery_dataset" "raw_sap" {
  dataset_id  = "raw_sap"
  description = "Raw SAP ERP inventory snapshots (Faker)"
  location    = var.region
}

resource "google_bigquery_dataset" "raw_salesforce" {
  dataset_id  = "raw_salesforce"
  description = "Raw Salesforce CRM customers (Faker)"
  location    = var.region
}

# Staging datasets — owned by dbt, one per source system
resource "google_bigquery_dataset" "stg_cegid" {
  dataset_id  = "stg_cegid"
  description = "Cleaned Cegid transactions (dbt staging layer)"
  location    = var.region
}

resource "google_bigquery_dataset" "stg_sap" {
  dataset_id  = "stg_sap"
  description = "Cleaned SAP inventory (dbt staging layer)"
  location    = var.region
}

resource "google_bigquery_dataset" "stg_salesforce" {
  dataset_id  = "stg_salesforce"
  description = "Cleaned Salesforce customers (dbt staging layer)"
  location    = var.region
}

# Note: Shopify (TheLook) and GA4 are BQ public datasets — no dataset to create here.
# References: bigquery-public-data.thelook_ecommerce / bigquery-public-data.ga4_obfuscated_sample_ecommerce
