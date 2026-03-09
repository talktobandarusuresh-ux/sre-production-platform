resource "aws_vpc" "sre_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sre-vpc"
  }
}