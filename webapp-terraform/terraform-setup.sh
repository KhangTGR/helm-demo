echo "Terraform Initialization..."
terraform init

sleep 60

echo "Terraform Applying..."
terraform apply --auto-approve