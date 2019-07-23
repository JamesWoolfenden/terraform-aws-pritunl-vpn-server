data "template_file" "kms_policy" {
  template = "${file("${path.module}/templates/key_policy.json.tpl")}"

  vars = {
    resource_name_prefix = var.resource_name_prefix
    account_id           = data.aws_caller_identity.current.account_id
    key_admin_arn        = aws_iam_role.role.arn
  }
}
