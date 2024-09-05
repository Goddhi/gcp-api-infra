variable "project" {
  description = "The zone where the resources will be deployed"
  type        = string
}

variable "routing_mode" {
  description = "The zone where the resources will be deployed"
  type        = string
}

variable "vpc-name" {
  description = "vpc name "
  type        = string
}

variable "infrastructure_name" {
  type        = string
  description = "The name of the infrastructure"
}



variable "environment" {
  description = "The zone where the resources will be deployed"
  type        = string
}

# variable "labels" {
#   description = "A map of labels to apply to the resource."
#   type        = map(string)
#   default     = {}  # Provide an empty map as a default if no labels are provided.

# }


variable "region" {
  description = "The region where the resources will be deployed"
  type        = string
}



variable "ip_cidr_range" {
  type = string
  description = "ip cidr range for the private subnet"
}

variable "nat_gateway" {
  type = string
  description = "manages the GKE egress taffic"
}

variable "nat_ip_allocate_option" {
  type = string
  description = "nat ip allocate option"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
  description = "source subnetwork ip ranges to nat"
}

variable "private-subnet-name" {
   type = string
  description = "private-subnet"
}


variable "nat-router-name" {
  type = string
  description = "combines with the nat gateway to manage the GKE egress taffic"
}

variable "internal-firewall-rule-name" {
    type = string
    description = "allow internal communication within the VPC (Virtual Private Cloud) network."
}

variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(string)
}

variable "internal_source_ranges" {
  description = "Internal source range allowed"
  type        = list(string)
}

variable "secondary_ip_range_services_cidr" {
    type = string
    description = "ip range for gke services" 
}

variable "secondary_ip_range_pods_cidr" {
    type = string
    description = " secondary ip range for gke pods" 
}

variable "secondary_ip_range_services_name" {
    type = string
    description = " secondary ip range name for gke services" 
}

variable "secondary_ip_range_pods_name" {
    type = string
    description = " secondary ip range name for gke pods" 
}

