resource "aws_kms_alias" "parameter_store" {
  depends_on = [aws_kms_key.parameter_store]

  name          = local.kms_alias
  target_key_id = aws_kms_key.parameter_store.key_id
}
