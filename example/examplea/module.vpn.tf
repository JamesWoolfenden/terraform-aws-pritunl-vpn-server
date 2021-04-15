module "vpn" {
  source           = "../../"
  aws_key_name     = ""
  whitelist        = ["10.0.0.0/16"]
  public_subnet_id = ""
  vpc_id           = ""
  ami_id           = ""
}
