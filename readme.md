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
