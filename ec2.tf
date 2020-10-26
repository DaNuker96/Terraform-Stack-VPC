#Private key and Key pair

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Create key pair using above private key

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.private_key.public_key_openssh

  depends_on = [tls_private_key.private_key]
}

#Save the private key at specified path.

resource "local_file" "saveKey" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "${var.base_path}${var.key_name}.pem"

}

#EC2 Instance

resource "aws_instance" "public_website_ec2" {
  ami                         = var.ami-linux
  instance_type               = var.instance-t2micro
  vpc_security_group_ids      = [aws_security_group.terraform_sg.id]
  subnet_id                   = aws_subnet.terraform_subnet_1.id
  key_name                    = "ec2-key"
  associate_public_ip_address = true
  tags = {
    Name = "terraform_ec2"
  }

  ################# TO DO need linux commands ##################
  user_data = <<-EOF
                  #!/bin/bash
                  sudo su
                  sudo yum update -y
                  sudo yum install -y httpd
                  cd /var/www/html
                  wget https://dhanukatestbucket.s3.eu-west-2.amazonaws.com/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd 
                  EOF
}
