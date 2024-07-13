# GCP cloud_run project using terraform

deploy hello world application on cloud_run using terraform

steps to follow:
1. create google cloud provider project named `terraform-GCP-project`
2. create Dockerfile for hello world application
3. create google cloud artifact registry in us-east1 to store hello word application image
4. create provider.tf file to access GCP
5. create cloudrun.tf file to write steps for deploy hello-world-app
    scripts steps:
    1. It creates a Google Cloud Run service named `hello-world-app` in the `us-east1` region. This service will use a container image located at `us-east1-docker.pkg.dev/terraform-GCP-project/hello-world-repo` and will expose port 3000.           
    2. It sets up a Google IAM policy named `noauth` that allows all users to invoke the Cloud Run service.
    3. It applies the `noauth` IAM policy to the "hello-world-app" Cloud Run service.

## Prerequisites

1. Google Cloud SDK installed and configured with your Google account.
2. Docker installed on your machine.
3. Terraform installed on your machine.

## Run this script:

   steps:
   1. Initialize terraform with all required providers
   ```bash
   terraform init
   ```
   2. This command showing all plan that metioned in cloudrun.tf file
   ```bash
   terraform plan
   ```
   3. This command make cloudrun service up
   ```bash
   terraform apply
   ```
   4. this command destroy all resources that made by terraform.
   ```bash
   terraform destroy
   ```