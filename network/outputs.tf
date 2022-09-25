output "vpc_id" {
  value = aws_vpc.ITI_vpc.id
}

output "ITI_public_subnet1" {
  value = aws_subnet.ITI_public_subnet1
}
output "ITI_public_subnet2" {
  value = aws_subnet.ITI_public_subnet2
}
output "ITI_private_subnet1" {
  value = aws_subnet.ITI_private_subnet1
}
output "ITI_private_subnet2" {
  value = aws_subnet.ITI_private_subnet2
}
