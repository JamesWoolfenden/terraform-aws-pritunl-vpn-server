resource "aws_security_group" "allow_from_office" {
  name        = local.sg_name_office
  description = "Allows SSH connections and HTTP(s) connections from office"
  vpc_id      = var.vpc_id

  # SSH access
  ingress {
    description = "Allow SSH access from select CIDRs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist
  }

  # HTTPS access
  ingress {
    description = "Allow HTTPS access from select CIDRs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist
  }

  # ICMP
  ingress {
    description = "Allow ICMPv4 from select CIDRs"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist
  }

  # outbound internet access
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
