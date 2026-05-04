resource "aws_ssm_parameter" "healthchecks_io_key" {
  # checkov:skip=CKV_AWS_337: SSM parameter type controls encryption
  name      = "/pritunl/${var.resource_name_prefix}/healthchecks-io-key"
  type      = "SecureString"
  value     = var.healthchecks_io_key
  key_id    = aws_kms_key.parameter_store.arn
  overwrite = true

  tags = var.common_tags
}
