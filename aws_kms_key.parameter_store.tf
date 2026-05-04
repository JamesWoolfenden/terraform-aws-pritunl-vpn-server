resource "aws_kms_key" "parameter_store" {
  # checkov:skip=CKV2_AWS_64: For example only, key policy managed via IAM
  description = "Parameter store and backup key for ${var.resource_name_prefix}"

  policy                  = data.template_file.kms_policy.rendered
  deletion_window_in_days = 30
  is_enabled              = true
  enable_key_rotation     = true

  tags = var.common_tags
}
