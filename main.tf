provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = [ "sg-02151ad397090c7e9" ]
}

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

