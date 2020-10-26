
#provider
variable "region" {
  type    = string
  default = "eu-west-2"
}

#ec2
variable "ami-linux" {
  type    = string
  default = "ami-0a669382ea0feb73a"
}
variable "instance-t2micro" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "ec2-key"
}
variable "base_path" {
  default = "../"
}

#network
variable "vpc-cidr-block" {
  type    = string
  default = "192.168.0.0/16"
}
variable "subnet-cidr-block" {
  type    = string
  default = "192.168.0.0/24"
}

#network & security-groups
variable "cidr-block-open" {
  type    = string
  default = "0.0.0.0/0"
}
variable "trusted-ipv4-address" {
  type    = string
  default = "81.110.57.43/32"
} #trusted ipv4 address(convert to cidr) for ssh connection

