



resource "google_compute_network" "vpc-network" {
name = format("%s-%s-%s", var.vpc-name, var.infrastructure_name, var.environment)
auto_create_subnetworks = false

description = "VPC for ${var.vpc-name} in ${var.environment} environment of ${var.infrastructure_name} infrastructure "
routing_mode = var.routing_mode

project = var.project

}

resource "google_compute_subnetwork" "private" {
name = format("%s-%s", var.private-subnet-name, var.infrastructure_name)
ip_cidr_range = var.ip_cidr_range
region = var.region
network = google_compute_network.vpc-network.id
private_ip_google_access = true
# secondary_ip_range {
# range_name = var.secondary_ip_range_services_name
# ip_cidr_range = var.secondary_ip_range_services_cidr
# }

# secondary_ip_range {
# range_name = var.secondary_ip_range_pods_name
# ip_cidr_range = var.secondary_ip_range_pods_cidr
# }

}