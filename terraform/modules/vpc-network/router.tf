resource "google_compute_router" "nat_router" {
  name    = format("%s-%s", var.nat-router-name, var.infrastructure_name)
  network = google_compute_network.vpc-network.id
  region  = var.region

    depends_on = [
  google_compute_network.vpc-network
   ]
}


