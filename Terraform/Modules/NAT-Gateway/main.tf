########################################
# Elastic IP
########################################

resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-EIP"
  }
}

########################################
# NAT Gateway
########################################

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.allocation_id
  subnet_id     = var.public_subnet_1_id

  tags = {
    Name = "${var.project_name}-NAT-Gateway"
  }

  depends_on = [
    aws_eip.this
  ]
}