data "template_file" "user_data" {
  template = file("${path.module}/templates/user_data.sh.tpl")

  vars = {
    aws_region          = data.aws_region.current.name
    s3_backup_bucket    = aws_s3_bucket.backup.id
    healthchecks_io_key = "/pritunl/${var.resource_name_prefix}/healthchecks-io-key"
  }
}
