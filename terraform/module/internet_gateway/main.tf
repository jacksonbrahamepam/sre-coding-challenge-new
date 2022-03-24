resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id
  tags = {
    Name = "vpc_igw_test"
  }
}