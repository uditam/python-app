resource "kubernetes_service" "service" {
  metadata {
    name      = "python-app-service"
    namespace = kubernetes_namespace.example.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.deployment.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      node_port   = 30201
      port        = 5000
      target_port = 5000
    }
  }
}