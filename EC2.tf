resource "aws_instance" "terraform-server1" {
  ami                         = var.server1-ami-id
  instance_type              = var.instance-type-server1
  key_name                    = var.server1-key-name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.terraform_secgroup.id]
  subnet_id                   = aws_subnet.terraform_private_subnet1.id
  availability_zone           = var.az1

  tags = {
    Name = "terraform-server1"
  }
}


resource "aws_instance" "terraform-server2" {
  ami                         = var.server2-ami-id
  instance_type               = var.instance-type-server2
  key_name                    = var.server2-key-name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.terraform_secgroup.id]
  subnet_id                   = aws_subnet.terraform_public_subnet2.id
  availability_zone           = var.az2

  tags = {
    Name = "terraform-server2"
  }
}