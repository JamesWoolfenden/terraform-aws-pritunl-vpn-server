resource "aws_security_group" "pritunl" {
  # checkov:skip=CKV_AWS_260: port 80 required for letsencrypt http-01 challenge
  # checkov:skip=CKV_AWS_382: Unrestricted outbound access required for resource functionality
  name        = local.sg_name
  description = local.sg_name
  vpc_id      = var.vpc_id

  # SSH access
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.internal_cidrs
  }

  # HTTP access for Let's Encrypt validation
  ingress {
    description = "Allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist_http
  }

  # HTTPS access
  ingress {
    description = "allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.internal_cidrs
  }

  # VPN WAN access
  ingress {
    description = "Allow WAN"
    from_port   = 10000
    to_port     = 19999
    # tfsec:ignore:AWS008
    protocol    = "udp"
    cidr_blocks = var.internal_cidrs
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # ICMP
  ingress {
    description = "Allow ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.internal_cidrs
  }

  # outbound internet access
  egress {
    description = "Allow outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    # tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}
