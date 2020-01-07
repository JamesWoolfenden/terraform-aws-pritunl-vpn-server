[![Slalom][logo]](https://slalom.com)

# terraform-aws-aws-pritunl-vpn-server

This a modified form of the Pritunl module for Terraform.

This module sets ups a VPN server for a VPC to connect to instances.

* Before you start to use the module you have to make sure you've created resources below*

* healthchecks.io account and cron entry for monitoring the backup script.

After provisioning, don't forget to run commands below:

* **Pritunl setup**
  * `sudo pritunl setup-key`

## Usage

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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id | AMI ID of Amazon Linux | string | n/a | yes |
| aws\_key\_name | SSH keypair name for the VPN instance | string | n/a | yes |
| common\_tags | A map of tags to add to all resources | map | `{}` | no |
| healthchecks\_io\_key | Health check key for healthchecks.io | string | `"invalid"` | no |
| instance\_type | Instance type for VPN Box | string | `"t2.micro"` | no |
| internal\_cidrs | [List] IP CIDRs to whitelist in the pritunl's security group | list(string) | `[ "10.0.0.0/8" ]` | no |
| public\_subnet\_id | One of the public subnet id for the VPN instance | string | n/a | yes |
| resource\_name\_prefix | All the resources will be prefixed with the value of this variable | string | `"pritunl"` | no |
| s3\_bucket\_name | [String] Optional S3 bucket name for backups | string | `""` | no |
| vpc\_id | Which VPC VPN server will be created in | string | n/a | yes |
| whitelist | [List] Office IP CIDRs for SSH and HTTPS | list(string) | n/a | yes |
| whitelist\_http | [List] Whitelist for HTTP port | list(string) | `[ "0.0.0.0/0" ]` | no |

## Outputs

| Name | Description |
|------|-------------|
| backup\_bucket |  |
| vpn\_instance\_private\_ip\_address |  |
| vpn\_management\_ui |  |
| vpn\_public\_ip\_address |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
