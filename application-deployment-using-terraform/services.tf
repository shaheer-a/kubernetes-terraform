resource "kubernetes_service" "api" {
  metadata {
    name = "api-service"
  }

  spec {
    selector = {
      app = "api"
    }

    port {
      port        = 3000
      target_port = 3000
    }
  }
}

resource "kubernetes_service" "frontend-service" {
  metadata {
    name = "frontend-service"
  }

  spec {
    selector = {
      app = "frontend"
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_service" "quote-service" {
  metadata {
    name = "quote-service"
  }

  spec {
    selector = {
      app = "quote"
    }

    port {
      port        = 5000
      target_port = 5000
    }
  }
}



# Define other services similarly
