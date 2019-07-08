resource "aws_iam_instance_profile" "ec2_profile" {
  depends_on = ["aws_iam_role.role", "aws_iam_role_policy.policy"]

  name = "${var.resource_name_prefix}-instance"
  role = aws_iam_role.role.name
}
