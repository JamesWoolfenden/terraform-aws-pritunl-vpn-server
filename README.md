# Overview

This a modifed form of the pritunl module for terraform.

This module setups a VPN server for a VPC to connect to instances.

*Before you start to use the module you have to make sure you've created resources below*

* healthchecks.io account and cron entry for monitoring the backup script

After provisioning, don't forget to run commands below:

* **Pritunl setup**
  * `sudo pritunl setup-key`

## Usage

```terraform

module "app_pritunl" {
  source = "github.com/opsgang/terraform_pritunl?ref=2.0.0"

  aws_key_name         = "org-eu-west-2"
  vpc_id               = "${module.vpc.vpc_id}"
  public_subnet_id     = "${module.vpc.public_subnets[1]}"
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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id | AMI ID of Amazon Linux | string | n/a | yes |
| aws\_key\_name | SSH keypair name for the VPN instance | string | n/a | yes |
| healthchecks\_io\_key | Health check key for healthchecks.io | string | `"invalid"` | no |
| instance\_type | Instance type for VPN Box | string | `"t2.micro"` | no |
| internal\_cidrs | [List] IP CIDRs to whitelist in the pritunl's security group | list(string) | `[ "10.0.0.0/8" ]` | no |
| public\_subnet\_id | One of the public subnet id for the VPN instance | string | n/a | yes |
| resource\_name\_prefix | All the resources will be prefixed with the value of this variable | string | `"pritunl"` | no |
| s3\_bucket\_name | [String] Optional S3 bucket name for backups | string | `""` | no |
| tags | A map of tags to add to all resources | map | `{}` | no |
| vpc\_id | Which VPC VPN server will be created in | string | n/a | yes |
| whitelist | [List] Office IP CIDRs for SSH and HTTPS | list(string) | n/a | yes |
| whitelist\_http | [List] Whitelist for HTTP port | list(string) | `[ "0.0.0.0/0" ]` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpn\_instance\_private\_ip\_address |  |
| vpn\_management\_ui |  |
| vpn\_public\_ip\_address |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

**P.S. :** Yes, AMI id is hardcoded! This module meant to be used in your VPC template. Presumably, no one wants to destroy the VPN instance and restore the configuration after `terraform apply` against to VPC. There is no harm to manage that manually and keep people working during the day.

*There will be wiki link about initial setup of Pritunl*
