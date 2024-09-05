# GKE Cluster Infrastructure with Terraform and Go CI/CD

This repository sets up a Google Kubernetes Engine (GKE) cluster and VPC private network using Terraform. The Go application is built and deployed as a Docker image to the GKE cluster via GitHub Actions.

## Prerequisites

Ensure you have the following installed on your local machine:

- [Go](https://golang.org/doc/install) version `1.23.0` or later
- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Steps to Run Locally

### 1. Clone the Repository

git clone https://github.com/Goddhi/gcp-api-infrastructure
cd your-repo

### Set Up Google Cloud Authentication
Set up a Google Cloud service account key and project ID.

Save your service account key as  in the  terraform directoy of this project 


### Start up the infrastructute with Terraform
cd terraform
terraform init
terraform plan
terraform apply -auto-approve

### Directory Structure
##### terraform/: 
This directory contains the main Terraform configuration files used to provision the infrastructure on GCP.

#### main.tf:
 The core Terraform file where the infrastructure resources (GKE cluster, VPC, etc.) are defined.
#### output.tf:
 Contains the output variables that export useful information, such as cluster details or network parameters, after the infrastructure is deployed.
#### variable.tf: 
Defines input variables that allow for flexibility and parameterization in the Terraform configuration. Key variables include:
gke_service_account_id: The service account ID used for managing the GKE cluster.
project: The GCP project ID where the infrastructure will be deployed.
name: A general name used for resource identification.
terraform.auto.tfvars: Stores default values for variables used in the configuration, such as the Docker image name for deployment.
#### /vpc-network/: 
This folder contains the Terraform files related to the Virtual Private Cloud (VPC) network setup.

#### main.tf:
 Defines the VPC, subnets, and necessary components for network management.
#### firewall-rule.tf: 
Configures firewall rules to control traffic to and from the network.
nat-gateway.tf: Sets up Network Address Translation (NAT) for enabling instances without public IP addresses to access the internet.
#### router.tf: 
Defines  router configurations required for traffic within the VPC


gsutil iam ch serviceAccount:api-sc@wide-axiom-428919-s0.iam.gserviceaccount.com:roles/storage.legacyBucketWriter gs://gcp-api-infrastrtucture-bucket
