#inputs

variable "region" {
  type = string
}

#VPC input values
variable "vpc_name" {
    type = string
}
variable "vpc_cidr" {
  type = string
}

#subnets input values
variable "public_subnet1_cidr" {
    type = string

}
variable "public_subnet2_cidr" {
    type = string

}
variable "private_subnet1_cidr" {
    type = string

}
variable "private_subnet2_cidr" {
    type = string

}
#subnets tags 
variable "public_subnet1_name" {
  type = string
}
variable "public_subnet2_name" {
  type = string
}
variable "private_subnet1_name" {
  type = string
}
variable "private_subnet2_name" {
  type = string
}