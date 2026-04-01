module "ec2_dev" {
  source = "../modules/ec2"
  
  ami_id = var.ami_id
  instance_name = var.instance_name
  instance_type = var.instance_type
}