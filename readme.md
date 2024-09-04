GCP API Infrastructure

gcloud compute google_compute_router delete nat-router-gcp-api-infrastructure
gcloud compute routers nats delete --router=nat-router-gcp-api-infrastructure - --region=us-central1

nat router
firewall rules



data "google_client_config" "default" {}

provider "kubernetes" {
host = google_container_cluster.primary.endpoint
token = http://data.google_client_config.default.access_token
cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)

}

resource "kubernetes_namespace" "gcp_api_infra_namespace" {
metadata {
name = var.namespace-name
}
}

resource "kubernetes_deployment" "gcp_api_infa_deployment" {
metadata {
name = "gcp-api-infra-deploy"
namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
}

spec {
replicas = 3

selector {
match_labels = {
app = var.app-name
}
}

template {
metadata {
labels = {
app = var.app-name
}
}

spec {
container {
name = var.container-name
image = var.app-image

port {
container_port = 8080
}
}
}
}
}
}

resource "kubernetes_service" "gcp_api_infra_service" {
metadata {
name = "gcp-api-infra-service"
namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
}
spec {
selector = {
app = var.app-name
}

port {
port = 80
target_port = 80
}

type = var.service-type
}
}

resource "kubernetes_ingress" "api_ingress" {
metadata {
name = "api-ingress"
namespace = kubernetes_namespace.gcp_api_infra_namespace.metadata[0].name
annotations = {
"http://kubernetes.io/ingress.class" : "nginx"
"http://nginx.ingress.kubernetes.io/rewrite-target" : "/"
}
}

spec {
rule {
http {
path {
path = "/"
#   path_type = "Prefix"
backend {
service_name = "gcp-api-infra-service"
service_port = 80
}
}
}
}
}

}
