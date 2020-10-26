
#OUTPUTS

output "aws_vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "aws_subnet_subnet_1" {
  value = aws_subnet.terraform_subnet_1.id
}

output "aws_instance_public_dns" {
  value = aws_instance.public_website_ec2.public_dns

}
output "aws_instance_id" {
  value = aws_instance.public_website_ec2.*.id
}

output "instance_public_ip" {
  value = aws_instance.public_website_ec2.public_ip
}
