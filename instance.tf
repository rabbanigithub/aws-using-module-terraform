module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.1.4"

  name = local.name

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  monitoring             = true
  availability_zone      = element(module.vpc.azs, 0)
  subnet_id              = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = [module.example_sg.security_group_id]
  user_data_base64            = base64encode(local.user_data)
  user_data_replace_on_change = true

  key_name = "mykeypair"
  tags     = local.tags
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}