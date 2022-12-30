# Setup infrastructure using Terraform
cd webapp-terraform
export TF_CLOUD_ORGANIZATION=dynamo-zone
terraform init
sleep 60
terraform apply
cd ..

