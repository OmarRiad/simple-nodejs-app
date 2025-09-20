resource "aws_instance" "jenkins-instance" {
  ami = data.aws_ami.amzn_linux_2023_latest.id
  instance_type = "t3.small"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  key_name = "jenkins"

  root_block_device {
    volume_size = 20   
    volume_type = "gp3"
  }
 
  tags = {
    Name = "jenkins-instance"
  }
}
