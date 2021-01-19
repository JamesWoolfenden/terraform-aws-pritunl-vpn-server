resource "aws_iam_instance_profile" "ec2_profile" {
  name       = local.profile_name
  role       = aws_iam_role.role.name
  depends_on = [aws_iam_role.role, aws_iam_role_policy.policy]
}
