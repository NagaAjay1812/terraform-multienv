resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type
  # Reference the security group ID here
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]

  #once ec2 is creted it will take the public ip and store in inventory.ini


  # Optional: Add tags to the instance for identification
  tags = {
    Name    = "terraform-${var.environment}"
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
    Name = "terraform_testing_sg-${var.environment}"
  }
}
