resource "kubernetes_namespace" "example" {
  metadata {
    name = "python"
  }

  provisioner "local-exec" {
    command = format("aws eks --region %s update-kubeconfig --name %s", var.region, local.cluster_name)
  }
}