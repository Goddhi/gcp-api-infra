resource "google_service_account" "gke_service_account" {
  account_id   = var.gke_service_account_id
  display_name =  format("%s-GKE-Service-Account", var.name) 
}

resource "google_project_iam_member" "gke_service_account_container_admin" {
  project = var.project
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_project_iam_member" "gke_service_account_compute_admin" {
  project = var.project
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_project_iam_member" "gke_service_account_storage_viewer" {
  project = var.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}
