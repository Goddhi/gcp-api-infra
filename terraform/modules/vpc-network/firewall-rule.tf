resource "google_compute_firewall" "allow_internal" {
  name    = format("%s-%s", var.internal-firewall-rule-name, var.infrastructure_name)
  network = google_compute_network.vpc-network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }
  
  source_ranges = var.internal_source_ranges

  depends_on = [
    google_compute_network.vpc-network
  ]
}

# Allows external access from anywhere to the api server
resource "google_compute_firewall" "allow-external" {
  name    = "allow-external-to-api"
  network = google_compute_network.vpc-network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]  
    depends_on = [
    google_compute_network.vpc-network
  ]
}