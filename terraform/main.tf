provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}


module "vpc-network" {
  source       = "./modules/vpc-network"
  project = var.project
  vpc-name = var.vpc-name
  ip_cidr_range = var.ip_cidr_range
  environment = var.environment
  region       = var.region
  routing_mode = var.routing_mode
  nat_ip_allocate_option = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  allowed_ports = var.allowed_ports
  internal_source_ranges = var.internal_source_ranges
  infrastructure_name = var.infrastructure_name
  nat-router-name = var.nat-router-name
  internal-firewall-rule-name = var.internal-firewall-rule-name
  private-subnet-name = var.private-subnet-name
  nat_gateway = var.nat_gateway
  secondary_ip_range_services_cidr = var.secondary_ip_range_services_cidr
  secondary_ip_range_pods_cidr = var.secondary_ip_range_pods_cidr
  secondary_ip_range_services_name = var.secondary_ip_range_services_name
  secondary_ip_range_pods_name = var.secondary_ip_range_pods_name

  
  
  
  
}

module "iam" {
  source                = "./modules/iam"
  project          = var.project
  gke_service_account_id = var.gke_service_account_id
  name                   =  var.gke_service_account_name

}

module "gke-cluster" {
  source                              = "./modules/gke-cluster"
  vpc-name                            =    module.vpc-network.network_id
  private-subnet-name                 = module.vpc-network.subnet_id
  cluster_name                        = var.cluster_name
  region                              = var.region
  zone                                = var.zone
  infrastructure_name                 = var.infrastructure_name
  node-pool-name                      = var.node-pool-name
  machine_type                        = var.machine_type
  gke_service_account_email           = module.iam.gke_service_account_email
  secondary_ip_range_services_name    = module.vpc-network.secondary_ip_range_services_name
  secondary_ip_range_services_cidr    = module.vpc-network.secondary_ip_range_services_cidr
  secondary_ip_range_pods_name        = module.vpc-network.secondary_ip_range_pods_name
  secondary_ip_range_pods_cidr        = module.vpc-network.secondary_ip_range_pods_cidr
  # master_ipv4_cidr_block              = var.master_ipv4_cidr_block
  disk_size_gb                        =  var.disk_size_gb
  min_node_count                      = var.min_node_count
  max_node_count                      = var.max_node_count
  # authorized-net-cidr                 = var.authorized-net-cidr
  # authorized-net-name                 = var.authorized-net-name
  disk_type                           = var.disk_type
  namespace-name                      = var.namespace-name 
  deploymentName                     = var.deploymentName
  app-name                            = var.app-name
  app-image                           = var.app-image
  service-name                        = var.service-name
  service-type                        = var.service-type
  containerName                       = var.containerName
  
}


