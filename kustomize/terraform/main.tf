# Use the null_resource to execute the Minikube start command
resource "null_resource" "start_minikube" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "minikube start --nodes=3"
  }
}

# Add a dependency on the null_resource to ensure it runs first
resource "null_resource" "minikube_dependency" {
  depends_on = [null_resource.start_minikube]
}
