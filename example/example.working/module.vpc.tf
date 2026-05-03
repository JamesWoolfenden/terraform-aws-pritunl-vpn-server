module "vpc" {
  source       = "git::https://github.com/JamesWoolfenden/terraform-aws-vpc.git?ref=1a6f4241e69b3c796f6c858b3f639e8626fe5c24"
  cidr         = var.cidr
  zone         = var.zone
  common_tags  = var.common_tags
  account_name = var.account_name
}
