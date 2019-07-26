module "app_pritunl" {
  source               = "github.com/JamesWoolfenden/terraform-aws-pritunl-vpn-server"
  ami_id               = data.aws_ami.amazon_linux.image_id
  aws_key_name         = aws_key_pair.ssh.key_name
  instance_type        = "t2.nano"
  public_subnet_id     = module.vpc.public_subnets[1]
  resource_name_prefix = "slalom-pritunl"
  tags                 = var.common_tags
  vpc_id               = module.vpc.vpc_id
  whitelist            = concat(var.whitelist, list("${module.data.ip}/32"))
  whitelist_http       = concat(var.whitelist_http, list("${module.data.ip}/32"))
}
