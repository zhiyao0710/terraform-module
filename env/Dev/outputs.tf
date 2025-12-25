output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  #value = module.web_ec2.instance_id
  value = module.web_ec2[*].instance_id
}
