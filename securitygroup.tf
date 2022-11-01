module "example_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"

  name        = local.name
  description = "Security group for EC2 Instacne allow ssh and http"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "allow ssh"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
