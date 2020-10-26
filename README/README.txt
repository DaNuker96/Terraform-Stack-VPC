Terraform IaC stack hosting a public web page in a
VPC bound environment

Prerequisites:

● AWS CLI
● Terraform
● AWS Config profile

Usage:

1. Open IDE terminal or CLI
2. Make sure to select an aws config profile (setx AWS_PROFILE default). This
stack uses the aws-cli default profile’s IAM Credentials.
3. terraform init (initializes terraform)
4. terraform validate (validates the code)
5. terraform plan (shows a preview of changes)
6. terraform apply (runs the code and applies changes)
7.Open website using public ipv4 dns address or public ipv4 address

Features

VPC and a public subnet
EC2 instance with user data to install apache web server
Public facing web page with downloaded html page from s3 bucket.
Key pair to ssh into EC2 instance
Route table,security group and Internet gateway for internet access