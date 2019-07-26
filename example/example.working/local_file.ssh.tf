resource "local_file" "pem-private" {
  filename = "${path.cwd}/id_rsa.${var.key_name}"
  content  = tls_private_key.ssh.private_key_pem
}

resource "local_file" "ssh-public" {
  content  = tls_private_key.ssh.public_key_openssh
  filename = "${path.cwd}/id_rsa.${var.key_name}.pub"
}
