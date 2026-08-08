output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "elastic_ip_id" {
  description = "Elastic IP ID"
  value       = aws_eip.this.id
}