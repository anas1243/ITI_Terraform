terraform {
  backend "s3" {
    bucket = "my-060389317043-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "TerraformStateLock"
  }
}