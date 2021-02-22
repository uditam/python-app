# Learn Terraform - Provision an EKS Cluster

This repo stores the assessment files.
The repo contains the following:

1. App folder containing the python app and depencencies, together with the Dockerfile build a working image.
2. Terraform code to set up and configure AWS EKS kubernetes cluster with a namespace named Python
3. Terraform code to deploy the image and run in on the Kubernetes cluster
4. Initial CircleCI pipeline config to lint and check the terraform code
5. Terraform code to initiate a password to be used with the RDS PostgreSQL user

Still to finish
a. Terraform creation of the RDS PostgreSQL database
b. Terraform creation of a secret holding the automatically created password - to be used as a pod's Env Var.
c. Beautify the CircleCI pipeline config.
d. many other ideas and suggestions

To run it all you need to:

1. The RDS PG is already created (might have extra time to terraform it as well)
2. Run the following command to build the image
  2.1 docker build -t python-app:latest .
3. Run terraform init from the root folder to install necessary providers
4. Run terraform apply to initiate creation of the EKS cluster, the namespacem, the deployment and the service to publish the app on a LoadBalancer
5. The app is accessible thru public internet

Udi Tam
uditam@gmail.com


