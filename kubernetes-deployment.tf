resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = "python-app"
    namespace = kubernetes_namespace.example.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "python-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "python-app"
        }
      }
      spec {
        container {
          image = "565105851053.dkr.ecr.us-east-1.amazonaws.com/python-app:latest"
          name  = "python-app-container"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}