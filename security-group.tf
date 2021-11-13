
resource "aws_security_group" "acesso-ssh" {
    name = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
      from_port = 22
      protocol = "tcp"
      to_port = 22
      cidr_blocks = ["190.89.142.142/32"]
    }
  
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
    provider = aws.us-east-2
    name = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
      from_port = 22
      protocol = "tcp"
      to_port = 22
      cidr_blocks = ["190.89.142.142/32"]
    }
  
  tags = {
    Name = "ssh"
  }
}