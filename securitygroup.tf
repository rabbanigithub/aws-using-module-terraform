module "example_service_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "4.13.1"

  name        = "example module sg"
  description = "Security group for EC2 Instacne allow ssh"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
