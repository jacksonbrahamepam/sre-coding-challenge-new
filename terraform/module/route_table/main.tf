resource "aws_route_table" "rt_public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "rt-public-test"
  }
}

resource "aws_route_table_association" "rt_public" {
  subnet_id      = var.public_snet
  route_table_id = aws_route_table.rt_public.id
}
