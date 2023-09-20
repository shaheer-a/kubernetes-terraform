resource "kubernetes_deployment" "api" {
  metadata {
    name = "api-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "api"
      }
    }

    template {
      metadata {
        labels = {
          app = "api"
        }
      }

      spec {
        container {
          name  = "api-container"
          image = "shaheer12/apigateway:latest"

          # Define resources, probes, and other container settings here

          # Liveness Probe
          liveness_probe {
            http_get {
              path = "/api/status"  # Adjust the path as needed
              port = 3000         # Adjust the port as needed
            }
            initial_delay_seconds = 30  # Adjust the initial delay as needed
            period_seconds        = 10  # Adjust the probe period as needed
          }

          # Readiness Probe
          readiness_probe {
            http_get {
              path = "/api/status"  # Adjust the path as needed
              port = 3000         # Adjust the port as needed
            }
            initial_delay_seconds = 30  # Adjust the initial delay as needed
            period_seconds        = 10  # Adjust the probe period as needed
          }
        }
      }
    }
  }
}
resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        container {
          name  = "frontend-container"
          image = "shaheer12/frontend:latest"

          # Define resources, probes, and other container settings here

          # Liveness Probe
          liveness_probe {
            http_get {
              path = "/"  # Adjust the path as needed
              port = 80         # Adjust the port as needed
            }
            initial_delay_seconds = 30  # Adjust the initial delay as needed
            period_seconds        = 10  # Adjust the probe period as needed
          }

          # Readiness Probe
          readiness_probe {
            http_get {
              path = "/index.html"  # Adjust the path as needed
              port = 80         # Adjust the port as needed
            }
            initial_delay_seconds = 30  # Adjust the initial delay as needed
            period_seconds        = 10  # Adjust the probe period as needed
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "quote" {
  metadata {
    name = "quote-deployment"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "quote"
      }
    }

    template {
      metadata {
        labels = {
          app = "quote"
        }
      }

      spec {
        container {
          name  = "quote-container"
          image = "shaheer12/quoteservice:latest"

          # Define resources, probes, and other container settings here

          # Liveness Probe
          liveness_probe {
            http_get {
              path = "/api/quote"  # Adjust the path as needed
              port = 5000         # Adjust the port as needed
            }
            initial_delay_seconds = 30  # Adjust the initial delay as needed
            period_seconds        = 10  # Adjust the probe period as needed
          }

          # Readiness Probe
          readiness_probe {
            http_get {
              path = "/api/quote"  # Adjust the path as needed
              port = 5000         # Adjust the port as needed
            }
            initial_delay_seconds = 30  # Adjust the initial delay as needed
            period_seconds        = 10  # Adjust the probe period as needed
          }
        }
      }
    }
  }
}



