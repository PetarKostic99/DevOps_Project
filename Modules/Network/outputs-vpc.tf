output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.pt-vpc.id
}

output "public_subnet" {
  description = "ID of public subnet"
  value       = aws_subnet.pt-public-subnet
}

output "private_subnet1" {
  description = "ID of private1 subnet"
  value       = aws_subnet.pt-private1-subnet
}

output "private_subnet2" {
  description = "ID of private2 subnet"
  value       = aws_subnet.pt-private2-subnet
}

output "db-subnet-group-name" {
  description = "ID of db private-subnet-group"
  value       = aws_db_subnet_group.pt-db-subnet-private-group.id
}