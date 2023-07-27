# Creating the operations cluster in staging

module "k8s_ops" {
    source = "app.terraform.io/bookstore/lke/linode"
    version = "1.0.2"
    linode_token = var.linode_token

    cluster_name = "bookstore-k8s-ops"
    k8s_version  = "1.26"
    region = "ap-south"

    server_type_node = "g6-standard-1"
    nodes = 3
    tag = ["bookstore-k8s-ops","bootstrap"]
}

module "argocd" {
    source  = "app.terraform.io/bookstore/argocd/linode"
    version = "1.0.6"
    # insert required variables here

    kubeconfig = module.k8s_ops.kubeconfig
    namespace = "argocd"

}
