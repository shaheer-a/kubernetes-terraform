resource "kubernetes_config_map" "api" {
  metadata {
    name = "quotes-api-config"
  }

  data = {
    QUOTES_API = "http://quotes:5000"
  }
}

# Define other ConfigMaps similarly
