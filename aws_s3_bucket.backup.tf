resource "aws_s3_bucket" "backup" {
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  depends_on = [aws_kms_key.parameter_store]
  bucket     = "vpn-backup-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  acl        = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.parameter_store.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  lifecycle_rule {
    prefix  = "backups"
    enabled = true

    expiration {
      days = 30
    }

    abort_incomplete_multipart_upload_days = 7
  }

  tags = var.common_tags
}
