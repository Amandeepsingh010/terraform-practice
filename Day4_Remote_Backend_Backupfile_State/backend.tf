terraform {
  backend "s3" {
    bucket = "bucket-aman-bucket.s3.us-east-1.amazonaws.com"
    key = "terraform.tfstate"
    dynamodb_table = "terraform-lock-table"
    region = "ap-south-1"
  }
}