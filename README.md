[![Slalom][logo]](https://slalom.com)

# terraform-aws-pritunl-vpn-server

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

This a modified form of the Pritunl module for Terraform.

This module sets ups a VPN server for a VPC to connect to instances.

* Before you start to use the module you have to make sure you've created resources below*

* healthchecks.io account and cron entry for monitoring the backup script.

After provisioning, don't forget to run commands below:

* **Pritunl setup**
  * `sudo pritunl setup-key`

## Usage

Include this repository as a module in your existing Terraform code:

```terraform

module "app_pritunl" {
  source               = "github.com/JamesWoolfenden/terraform-aws-pritunl-vpn-server"
  aws_key_name         = "org-eu-west-2"
  vpc_id               = module.vpc.vpc_id
  public_subnet_id     = module.vpc.public_subnets[1]
  ami_id               = "ami-403e2524"
  instance_type        = "t2.nano"
  resource_name_prefix = "opsgang-pritunl"
  healthchecks_io_key  = "NNNNNNNN-NNNN-NNNN-NNNN-NNNNNNNNNNN"
  s3_bucket_name       = "i-want-to-override-generated-bucket-name"

  whitelist = [
    "8.8.8.8/32",
  ]

  tags {
    "role" = "vpn"
    "env"  = "prod"
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Error: no lines in file
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
