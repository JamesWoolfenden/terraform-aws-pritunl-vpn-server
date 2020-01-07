resource "aws_kms_alias" "parameter_store" {
  depends_on = [aws_kms_key.parameter_store]

  name          = "alias/${var.resource_name_prefix}-parameter-store"
  target_key_id = aws_kms_key.parameter_store.key_id
}
