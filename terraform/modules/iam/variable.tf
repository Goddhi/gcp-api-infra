variable "gke_service_account_id" {
    type = string
    description = "service account id for the gke cluster"
}

variable "project" {
  description = "The ID of the GCP project"
  type        = string
}

variable "name" {
  description = "Name to be used on all the resources as identifier."
  type        = string
}

