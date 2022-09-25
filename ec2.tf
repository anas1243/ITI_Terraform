resource "aws_instance" "bastion" {
  ami           = "ami-026b57f3c383c2eec" # us-east-1
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id]
  subnet_id = module.iti_network.ITI_public_subnet1.id
  key_name = "ITI_key_terraform"
  tags = {
    Name = "bastion"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip}\n"
  }
}

resource "aws_instance" "application" {
  ami           = "ami-026b57f3c383c2eec" # us-east-1
  instance_type = "t2.micro"
  associate_public_ip_address = false
  vpc_security_group_ids = [ aws_security_group.allow_tcp_ssh.id]
  subnet_id = module.iti_network.ITI_private_subnet1.id
  key_name = "ITI_key_terraform"
  tags = {
    Name = "application"
  }
}