data "aws_security_group" "web_sg" {
   id = "sg-017979597fc362e5a"
}



module "web_ec2" {
  source = "../../modules/ec2"

  ami                  = var.ami
  instance_type        = var.instance_type
#  security_group_ids   = [module.web_sg.id]
  security_group_ids    = [data.aws_security_group.web_sg.id]

  tags = {
    Name = "web-prod"
    Env  = "prod"
  }
}
