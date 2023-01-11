# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
#   }
# }
module "ec2_instances" {
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "2.12.0"
  key_name       = "default-key"
  name           = var.ec2_instance_name
  instance_count = 1

  ami                    = "ami-0fcb2a83f2fd006fb" #Using customer AMI #data.aws_ami.amazon_linux.id
  instance_type          = var.ec2_instance_types
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
}

resource "null_resource" "EC2InstanceIP" {
  depends_on = [
    module.ec2_instances
  ]

  provisioner "local-exec" {
    command = "sed -i '2s/.*/${module.ec2_instances.private_ip[0]}/' ./playbooks/inventory.yml"
  }
}