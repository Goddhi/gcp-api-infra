terraform {
  backend "gcs" {
    bucket = "gcp-api-infrastrtucture-bucket"
    prefix = "terraform/state"
  }
}


