resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = <<EOT
[jenkins_agent]
${aws_instance.jenkins-instance.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/jenkins.pem
EOT
}