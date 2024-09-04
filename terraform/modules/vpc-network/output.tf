output "network_id" {
  value = google_compute_network.vpc-network.id

  description = "The id of the private subnet"
}


output "subnet_id" {
  description = "The vpc network id"
  value       = google_compute_subnetwork.private.id

}



output "secondary_ip_range_services_name" {
  value = google_compute_subnetwork.private.secondary_ip_range[0].range_name
}

output "secondary_ip_range_services_cidr" {
  value = google_compute_subnetwork.private.secondary_ip_range[0].ip_cidr_range
}

output "secondary_ip_range_pods_name" {
  value = google_compute_subnetwork.private.secondary_ip_range[1].range_name
}

output "secondary_ip_range_pods_cidr" {
  value = google_compute_subnetwork.private.secondary_ip_range[1].ip_cidr_range
}

