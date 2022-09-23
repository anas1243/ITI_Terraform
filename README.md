# ITI Terraform


IT is series of labs that provide hands on experience working on provisioning AWS infrastruction using Terraform.

## Branches


Each branch is a lab that covers a certain topic in Terraform

### Configurations


1. Install Terraform
View Terraform wonderful documentation from [Here](https://learn.hashicorp.com/tutorials/terraform/install-cli).

2. Set your AWS credentials
Write then in ~/.aws/credentials manually or by using `aws configure` command.

3. Provision the infrastructure
After cloning ITI Terraform on your working directory, use  `terraform apply` command.

4. Destoying the infrastructure
Don't forget to destroy the applied infrastructure to avoid extra charge, use `terraform destroy` command

### Branches


1. main --> Latest changes are applied here by merging all labs in it
2. lab1 --> hands on experience making basic network infrastructure such as: VPC, 2 Public subnets, 2 Private subnets, IGW, NAT-GW and Route table
