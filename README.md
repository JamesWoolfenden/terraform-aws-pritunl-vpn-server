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

## Costs

```text
Monthly cost estimate

Project: .

 Name                                                     Monthly Qty  Unit                Monthly Cost

 module.vpn.aws_eip.pritunl
 └─ IP address (if unused)                                        730  hours                      $3.65

 module.vpn.aws_instance.pritunl
 ├─ Instance usage (Linux/UNIX, on-demand, t2.micro)              730  hours                      $9.64
 ├─ EC2 detailed monitoring                                         7  metrics                    $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                           8  GB-months                  $0.93

 module.vpn.aws_kms_key.parameter_store
 ├─ Customer master key                                             1  months                     $1.00
 ├─ Requests                                          Cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                  Cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                  Cost depends on usage: $0.10 per 10k requests

 module.vpn.aws_s3_bucket.backup
 └─ Standard
    ├─ Storage                                        Cost depends on usage: $0.02 per GB-months
    ├─ PUT, COPY, POST, LIST requests                 Cost depends on usage: $0.0053 per 1k requests
    ├─ GET, SELECT, and all other requests            Cost depends on usage: $0.00042 per 1k requests
    ├─ Select data scanned                            Cost depends on usage: $0.00225 per GB-months
    └─ Select data returned                           Cost depends on usage: $0.0008 per GB-months

 PROJECT TOTAL                                                                                   $17.31
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.pritunl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.ec2_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_instance.pritunl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_kms_alias.parameter_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.parameter_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_security_group.allow_from_office](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.pritunl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.healthchecks_io_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [template_file.iam_instance_role_policy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.kms_policy](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID of Amazon Linux | `string` | n/a | yes |
| <a name="input_aws_key_name"></a> [aws\_key\_name](#input\_aws\_key\_name) | SSH keypair name for the VPN instance | `any` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(any)` | `{}` | no |
| <a name="input_healthchecks_io_key"></a> [healthchecks\_io\_key](#input\_healthchecks\_io\_key) | Health check key for healthchecks.io | `string` | `"invalid"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for VPN Box | `string` | `"t2.micro"` | no |
| <a name="input_internal_cidrs"></a> [internal\_cidrs](#input\_internal\_cidrs) | [List] IP CIDRs to whitelist in the pritunl's security group | `list(string)` | <pre>[<br>  "10.0.0.0/8"<br>]</pre> | no |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | One of the public subnet id for the VPN instance | `any` | n/a | yes |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | All the resources will be prefixed with the value of this variable | `string` | `"pritunl"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | [String] Optional S3 bucket name for backups | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Which VPC VPN server will be created in | `any` | n/a | yes |
| <a name="input_whitelist"></a> [whitelist](#input\_whitelist) | [List] Office IP CIDRs for SSH and HTTPS | `list(string)` | n/a | yes |
| <a name="input_whitelist_http"></a> [whitelist\_http](#input\_whitelist\_http) | [List] Whitelist for HTTP port | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backup_bucket"></a> [backup\_bucket](#output\_backup\_bucket) | n/a |
| <a name="output_vpn_instance_private_ip_address"></a> [vpn\_instance\_private\_ip\_address](#output\_vpn\_instance\_private\_ip\_address) | n/a |
| <a name="output_vpn_management_ui"></a> [vpn\_management\_ui](#output\_vpn\_management\_ui) | n/a |
| <a name="output_vpn_public_ip_address"></a> [vpn\_public\_ip\_address](#output\_vpn\_public\_ip\_address) | n/a |
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
