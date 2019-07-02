locals {
  backup_bucket_name = "${var.s3_bucket_name != "" ? var.s3_bucket_name : format("%s-%s", var.resource_name_prefix, "backup")}"
}
