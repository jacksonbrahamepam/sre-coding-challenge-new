output "vpc_id" {
  description = "The VPC ID to create in"
  value       = aws_vpc.vpc.id
}