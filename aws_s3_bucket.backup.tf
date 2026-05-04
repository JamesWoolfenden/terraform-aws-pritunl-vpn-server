resource "aws_s3_bucket" "backup" {
  # checkov:skip=CKV2_AWS_61: Lifecycle configuration not required for this bucket
  # checkov:skip=CKV2_AWS_62: Event notifications not required for this bucket
  # tfsec:ignore:AWS002
  # tfsec:ignore:AWS077
  # checkov:skip=CKV_AWS_144: not appropriate
  # checkov:skip=CKV2_AWS_37: not appropriate
  # checkov:skip=CKV2_AWS_41: not appropriate
  # checkov:skip=CKV_AWS_145:v4 legacy
  # checkov:skip=CKV_AWS_19:v4 legacy
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  depends_on = [aws_kms_key.parameter_store]
  bucket     = local.backup_bucket

  tags = var.common_tags
}
resource "aws_s3_bucket_lifecycle_configuration" "backup" {
  bucket = aws_s3_bucket.backup.id

  rule {
    id = "backup"
    filter {
      prefix = "backups"
    }
    status = "Enabled"
    expiration {
      days = 30
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}
resource "aws_s3_bucket_acl" "backup" {
  bucket = aws_s3_bucket.backup.bucket
  acl    = "private"
}
resource "aws_s3_bucket_server_side_encryption_configuration" "backup" {
  bucket = aws_s3_bucket.backup.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.parameter_store.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
