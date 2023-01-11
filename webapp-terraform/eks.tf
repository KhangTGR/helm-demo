module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.20"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      instance_types = [var.node_instance_types]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
      tags = {
        "k8s.io/cluster-autoscaler/enabled"               = true
        "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
      }
    }

    two = {
      name           = "node-group-2"
      instance_types = [var.node_instance_types]
      min_size       = 1
      max_size       = 2
      desired_size   = 1
      tags = {
        "k8s.io/cluster-autoscaler/enabled"               = true
        "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
      }
    }
  }
}
