resource "aws_iam_role_policy" "policy" {
  depends_on = [aws_iam_role.role]

  name   = "${var.resource_name_prefix}-instance-policy"
  role   = aws_iam_role.role.id
  policy = data.template_file.iam_instance_role_policy.rendered
}
