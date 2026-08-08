output "rds_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.this.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}