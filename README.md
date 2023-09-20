Make sure you have kubectl, minikube and terraform are installed.

To create a 3 Node minikube cluster go to kustomize and then terraform directories

cd kustomize/
cd terrform/
run the following commands in terraform directory
terraform init
terraform apply

You will have your 3 minikube cluster created in a while depending on your machine and internet specs.

kubectl get nodes #run this command to check the status of your kubernetes cluster.

go back to kustomize directory

cd ..

"manifests" directory contains the deployment, service, configmap and other relevant configuration files to deploy the application in kubernetes cluster.

Run the following command to start deployment of your application which consists of ApiGateway, FrontEnd and QuoteService.

kubectl apply -k .

if everything is configured properly you'll have your application deployed in a while.

run the following command to check different statuses during the deployment process

kubectl get pods --all-namespaces

kubectl get deployments

kubectl get svc

kubectl get events -w

kubectl describe 

kubectl logs
delete your cluster by running "minikube delete" command.
 
---------------------------------------------------------------------------------------------------------------------------------

To deploy the same application using terraform 

go to application-deployment-using-terraform directory

application-deplpyment-using-terraform directory contains the relevant terraform configuration files required to deploy the application in kubernetes using terraform.

cd application-deployment-using-terraform/

create a minikube cluster either by running "minikube start" or go back to kustomize/terraform directory and run terraform apply to have a new kubernetes cluster.

run the following command to deploy your application in kubernetese cluster using terraform while staying in application-deployment-using-terraform directory.

terraform init
terraform apply

You'll have your application deployed in a while if your cluster is clean and properly configured.

