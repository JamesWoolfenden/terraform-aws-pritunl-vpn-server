resource "aws_instance" "pritunl" {
  # checkov:skip=CKV2_AWS_17: Rubbish

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.aws_key_name
  user_data     = data.template_file.user_data.rendered
  ebs_optimized = true
  monitoring    = true

  vpc_security_group_ids = [
    aws_security_group.pritunl.id,
    aws_security_group.allow_from_office.id,
  ]

  subnet_id            = var.public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    encrypted = true
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = merge({ "Name" = "${var.resource_name_prefix}-vpn" }, var.common_tags)
}
