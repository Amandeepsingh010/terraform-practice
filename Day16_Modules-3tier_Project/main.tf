module "vpc" {
  source = "./modules/vpc"
}

# Security Group (simple)
resource "aws_security_group" "sg" {
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "frontend" {
  source    = "./modules/ec2"
  ami       = data.aws_ami.amzlinux.id
  subnet_id = module.vpc.subnet_ids[0]
  sg_id     = aws_security_group.sg.id
  name      = "Frontend"
}

module "backend" {
  source    = "./modules/ec2"
  ami       = data.aws_ami.amzlinux.id
  subnet_id = module.vpc.subnet_ids[1]
  sg_id     = aws_security_group.sg.id
  name      = "Backend"
}

module "db" {
  source = "./modules/rds"
  subnet_ids = module.vpc.subnet_ids
}

module "alb" {
  source = "./modules/alb"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids

  frontend_instance_id = module.frontend.instance_id 
  backend_instance_id  = module.backend.instance_id 
}
