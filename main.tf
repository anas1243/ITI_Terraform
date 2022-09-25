module "iti_network" {
  source = "./network"
    region = var.region
    vpc_name = var.vpc_name
    vpc_cidr = var.vpc_cidr
    public_subnet1_cidr = var.public_subnet1_cidr
    public_subnet2_cidr = var.public_subnet2_cidr
    private_subnet1_cidr = var.private_subnet1_cidr
    private_subnet2_cidr = var.private_subnet2_cidr

    public_subnet1_name = var.public_subnet1_name
    public_subnet2_name = var.public_subnet2_name
    private_subnet1_name = var.private_subnet1_name
    private_subnet2_name = var.private_subnet2_name
}