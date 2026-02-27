data "aws_ami" "roboshop" { # to query the ami_id
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["NagaAjay-Ragyari-Build-2026-01-19T20-45-28Z"]
  }
}
