resource "aws_instance" "roboshop" {
  ami = local.ami_id
  # we have lookup(map, key) function : you know map, key the value will be return
  instance_type = lookup(var.instance_type, local.environment)

  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]

  #once ec2 is creted it will take the public ip and store in inventory.ini


  # Optional: Add tags to the instance for identification
  tags = {
    Name    = "${var.project}-${local.environment}" #roboshop-dev
    Project = "Roboshop"

  }
}


resource "aws_security_group" "roboshop_sg" {
  name        = "terraform_testing_sg_new" # this is for AWS account
  description = "Allow TLS inbound traffic"


  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = {
    Name = "terraform_testing_sg"
  }
}
