resource "aws_s3_bucket" "backup" {
  depends_on = ["aws_kms_key.parameter_store"]

  bucket = "${local.backup_bucket_name}"

  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.parameter_store.arn}"
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

  tags = "${
    merge(
      map("Name", local.backup_bucket_name),
      var.tags,
    )
  }"
}
