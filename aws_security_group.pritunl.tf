resource "aws_security_group" "pritunl" {
  name        = local.sg_name
  description = local.sg_name
  vpc_id      = var.vpc_id

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.internal_cidrs
  }

  # HTTP access for Let's Encrypt validation
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    # tfsec:ignore:AWS008
    cidr_blocks = var.whitelist_http
  }

  # HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.internal_cidrs
  }

  # VPN WAN access
  ingress {
    from_port = 10000
    to_port   = 19999
    # tfsec:ignore:AWS008
    protocol    = "udp"
    cidr_blocks = var.internal_cidrs
    #cidr_blocks = ["0.0.0.0/0"]
  }

  # ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.internal_cidrs
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
