locals {
  backup_bucket  = "vpn-backup-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  profile_name   = "${var.resource_name_prefix}-instance"
  policy_name    = "${var.resource_name_prefix}-instance-policy"
  kms_alias      = "alias/${var.resource_name_prefix}-parameter-store"
  sg_name_office = "${var.resource_name_prefix}-whitelist"
  sg_name        = "${var.resource_name_prefix}-vpn"
}
