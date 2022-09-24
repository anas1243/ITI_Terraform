variable "region" {
  type = string
}


#aws cidr block for all resources
variable "vpc_cidr" {
  type = string
}
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


#aws tags for all resources
variable "vpc_name" {
  type = string
}
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
