terraform {
  backend "s3" {
    bucket         = "bucket-aman-bucket"
    key            = "project/terraform.tfstate"
    region         = "us-east-1"
  }
}   