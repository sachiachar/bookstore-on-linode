# Output the context information for the operation cluster
output "kubeconfig_ops" {
  value = module.k8s_ops.kubeconfig
  sensitive = true
}

output "host_ops" {
    value = yamldecode(nonsensitive(module.k8s_ops.kubeconfig)).clusters[0].cluster.server
}

output "cluster_ca_certificate_ops" {
    value = base64decode(yamldecode(nonsensitive(module.k8s_ops.kubeconfig)).clusters[0].cluster.certificate-authority-data)
}

output "token_ops" {
    value = yamldecode(nonsensitive(module.k8s_ops.kubeconfig)).users[0].user.token
}

# output "argocd_credentials" {
#   value       = module.argocd_example_default.argocd
#   description = "Argocd_Info"
# }
