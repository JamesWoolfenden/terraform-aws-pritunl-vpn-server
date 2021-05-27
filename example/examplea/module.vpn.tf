module "vpn" {
  source           = "../../"
  aws_key_name     = ""
  whitelist        = ["10.0.0.0/16"]
  public_subnet_id = tolist(data.aws_subnet_ids.public.ids)[0]
  vpc_id           = local.vpc_id
  ami_id           = data.aws_ami.redhat.id
}
