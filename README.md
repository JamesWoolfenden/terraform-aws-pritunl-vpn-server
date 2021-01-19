# terraform-aws-pritunl-vpn-server

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-pritunl-vpn-server/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-pritunl-vpn-server)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-pritunl-vpn-server.svg)](https://github.com/JamesWoolfenden/terraform-aws-pritunl-vpn-server/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-pritunl-vpn-server.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-pritunl-vpn-server/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-pritunl-vpn-server/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-pritunl-vpn-server&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-pritunl-vpn-server/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-pritunl-vpn-server&benchmark=INFRASTRUCTURE+SECURITY)

This a modified form of the Pritunl module for Terraform.

This module sets ups a VPN server for a VPC to connect to instances.

- Before you start to use the module you have to make sure you've created resources below\*

- healthchecks.io account and cron entry for monitoring the backup script.

After provisioning, don't forget to run commands below:

(**Pritunl setup**)

```bash
`sudo pritunl setup-key`
```

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
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_id | AMI ID of Amazon Linux | `string` | n/a | yes |
| aws\_key\_name | SSH keypair name for the VPN instance | `any` | n/a | yes |
| common\_tags | A map of tags to add to all resources | `map(any)` | `{}` | no |
| healthchecks\_io\_key | Health check key for healthchecks.io | `string` | `"invalid"` | no |
| instance\_type | Instance type for VPN Box | `string` | `"t2.micro"` | no |
| internal\_cidrs | [List] IP CIDRs to whitelist in the pritunl's security group | `list(string)` | <pre>[<br>  "10.0.0.0/8"<br>]</pre> | no |
| public\_subnet\_id | One of the public subnet id for the VPN instance | `any` | n/a | yes |
| resource\_name\_prefix | All the resources will be prefixed with the value of this variable | `string` | `"pritunl"` | no |
| s3\_bucket\_name | [String] Optional S3 bucket name for backups | `string` | `""` | no |
| vpc\_id | Which VPC VPN server will be created in | `any` | n/a | yes |
| whitelist | [List] Office IP CIDRs for SSH and HTTPS | `list(string)` | n/a | yes |
| whitelist\_http | [List] Whitelist for HTTP port | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| backup\_bucket | n/a |
| vpn\_instance\_private\_ip\_address | n/a |
| vpn\_management\_ui | n/a |
| vpn\_public\_ip\_address | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-pritunl-vpn-server&url=https://github.com/jameswoolfenden/terraform-aws-pritunl-vpn-server
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-pritunl-vpn-server&url=https://github.com/jameswoolfenden/terraform-aws-pritunl-vpn-server
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-pritunl-vpn-server
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-pritunl-vpn-server
[share_email]: mailto:?subject=terraform-aws-pritunl-vpn-server&body=https://github.com/jameswoolfenden/terraform-aws-pritunl-vpn-server
