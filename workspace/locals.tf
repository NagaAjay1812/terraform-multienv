locals {
  ami_id      = data.aws_ami.roboshop.id
  environment = terraform.workspace
}
