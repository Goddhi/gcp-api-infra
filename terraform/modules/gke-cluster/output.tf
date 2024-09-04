output "ingress_external_ip" {
  value       = kubernetes_service.gcp_api_infra_service.status[0].load_balancer[0].ingress[0].ip
  description = "The external IP address of the LoadBalancer service"
}