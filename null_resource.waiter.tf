resource "null_resource" "waiter" {
  depends_on = ["aws_iam_instance_profile.ec2_profile"]

  provisioner "local-exec" {
    command = "sleep 15"
  }
}
