resource "aws_eip" "nat_eip" {
  count = length(var.private_subnet_cidrs)
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count          = length(var.private_subnet_cidrs)
  depends_on     = [aws_eip.nat_eip]

  allocation_id  = aws_eip.nat_eip[count.index].id
  subnet_id      = aws_subnet.private[count.index].id
}
