# Terraform_ECR

This module creates a cross-account ECR repo. Native account could only list and get the images in the repo.

have the secret variables defined in terraform.tfvars file in cloned directory.

Requires - cross account ID.

Requirements - terraform

Creates - ECR, ECR cross account policy and ecr life cycle policy.

steps

1) clone : git clone https://github.com/Venuvgp19/Terraform_ECR.git
2) cd Terraform_ECR
3) terraform init
4) terraform validate
5) terraform plan
6) terraform apply 
