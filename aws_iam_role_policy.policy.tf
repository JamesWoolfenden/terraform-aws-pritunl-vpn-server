resource "aws_iam_role_policy" "policy" {
  # checkov:skip=CKV_AWS_290: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_355: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  depends_on = [aws_iam_role.role]

  name   = local.policy_name
  role   = aws_iam_role.role.id
  policy = data.template_file.iam_instance_role_policy.rendered
}
