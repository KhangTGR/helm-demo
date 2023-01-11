# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes
# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "eks-cluster-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "key_pair" {
  source             = "terraform-aws-modules/key-pair/aws"
  key_name           = "jenkins-key"
  create_private_key = true
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = var.ec2_instance_sg
  description = "Security group for example usage with EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}

# resource "null_resource" "kubernetes" {
#   depends_on = [
#     module.ec2_instances
#   ]
#   provisioner "local-exec" {
#     # command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key /root/.ssh/jenkins-key.pem -i ./playbooks/inventory.yml ./playbooks/kubernetes.yml"
#     command = "ansible-playbook -u ec2-user --private-key ~/jenkins-key.pem -i ./playbooks/inventory.yml ./playbooks/kubernetes.yml"
#   }
# }

# resource "null_resource" "docker" {
#   depends_on = [
#     module.ec2_instances
#   ]
#   provisioner "local-exec" {
#     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key ~/jenkins-key.pem -i ./playbooks/inventory.yml ./playbooks/docker.yml"
#   }
# }

# resource "null_resource" "setupJenkinsEBS" {
# depends_on = [
#   module.ec2_instances,
#   aws_volume_attachment.this  
# ]
#   provisioner "local-exec" {
#     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ec2-user --private-key /root/.ssh/jenkins-key.pem -i ./playbooks/inventory.yml ./playbooks/jenkins.yml"
#   }
# }

