resource "aws_ebs_volume" "this" {
  availability_zone = module.ec2_instances.availability_zone[0]
  size              = 1

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2_instances.id[0]
}