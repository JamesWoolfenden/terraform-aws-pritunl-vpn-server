resource "aws_kms_key" "parameter_store" {
  depends_on = [null_resource.waiter]

  description = "Parameter store and backup key for ${var.resource_name_prefix}"

  policy                  = data.template_file.kms_policy.rendered
  deletion_window_in_days = 30
  is_enabled              = true
  enable_key_rotation     = true

  tags = var.common_tags
}
