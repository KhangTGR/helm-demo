### Refferences: 
* https://developer.hashicorp.com/terraform/language/modules/develop/structure
* https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks
# Build infrastructure by Terraform instructions
## Step 1 | Provision AWS infrastructure

First, access the webapp-terraform directory and run these commands below:

    terraform init
    terraform apply -auto-approve 

## Step 2 | Connect kubectl to EKS Cluster 

    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

# Have fun and good luck!