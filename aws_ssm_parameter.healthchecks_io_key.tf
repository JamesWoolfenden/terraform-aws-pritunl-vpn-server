resource "aws_ssm_parameter" "healthchecks_io_key" {
  name      = "/pritunl/${var.resource_name_prefix}/healthchecks-io-key"
  type      = "SecureString"
  value     = var.healthchecks_io_key
  key_id    = aws_kms_key.parameter_store.arn
  overwrite = true

  tags = "${
    merge(
      map("Name", format("%s/%s/%s", "pritunl", var.resource_name_prefix, "healthchecks-io-key")),
      var.tags,
    )
  }"
}
