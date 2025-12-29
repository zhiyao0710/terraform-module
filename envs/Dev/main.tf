module "vpc" {
  source = "../../modules/vpc"

  cidr_block = "10.0.0.0/16"
  name       = "dev-vpc"
}


module "web_sg" {
  source = "../../modules/security-group"

  name         = "web-sg-dev"
  vpc_id       = module.vpc.vpc_id
  ingress_port = 22
  cidr_blocks  = ["0.0.0.0/0"]
}

module "web_ec2" {
  source = "../../modules/ec2"

  count = 1
  ami                  = var.ami
  instance_type        = var.instance_type
  security_group_ids   = [module.web_sg.id]

  tags = {
    Name = "web-dev-${count.index}"
    Env  = "dev"
    trigger = "workflow"
  }
}

module "web_ec2_legacy" {
  source = "../../modules/ec2"

  ami                  = var.ami
  instance_type        = var.instance_type
  security_group_ids   = [module.web_sg.id]

  tags = {
    Name = "web-dev-web_ec2_legacy"
    Env  = "dev"
  }
}


/* 
module "web_ec2_test" {
  source = "../../modules/ec2"

  for_each = {
    web1 = "t3.micro"
    web2 = "t3.small"
    web3 = "t3.micro"
  }

  ami           = var.ami
  instance_type = each.value

  tags = {
    Name = each.key
    Env  = "dev"
  }
} 
*/
