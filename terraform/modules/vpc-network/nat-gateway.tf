resource "google_compute_router_nat" "nat_gateway" {
  name   = format("%s-%s", var.nat_gateway, var.infrastructure_name)
  router = google_compute_router.nat_router.name
  region = var.region

  nat_ip_allocate_option = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

    depends_on = [
      google_compute_network.vpc-network
  ]
}
