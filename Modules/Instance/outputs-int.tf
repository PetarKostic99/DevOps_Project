output "vpc-security-group-ids" {
  description = "ID of DB private-subnet"
  value       = aws_security_group.internal-db-mysql.id
}