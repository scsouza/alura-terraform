provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 1
    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [
      aws_s3_bucket.dev4
    ]
}



resource "aws_instance" "dev5" {
    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "silassouza01-dev4"
  acl    = "private"

  tags = {
    Name = "silassouza01-dev4"
  }
}

