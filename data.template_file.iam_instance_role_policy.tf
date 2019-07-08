data "template_file" "iam_instance_role_policy" {
  template = "${file("${path.module}/templates/iam_instance_role_policy.json.tpl")}"

  vars = {
    s3_backup_bucket     = local.backup_bucket_name
    resource_name_prefix = var.resource_name_prefix
    aws_region           = data.aws_region.current.name
    account_id           = data.aws_caller_identity.current.account_id
    ssm_key_prefix       = "/pritunl/${var.resource_name_prefix}/*"
  }
}
