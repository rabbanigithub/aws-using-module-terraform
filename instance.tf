module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.1.4"

  name = local.name

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  monitoring                  = true
  availability_zone           = element(module.vpc.azs, 0)
  subnet_id                   = element(module.vpc.private_subnets, 0)
  vpc_security_group_ids      = [module.example_sg.security_group_id]
  associate_public_ip_address = true
  key_name                    = [aws_key_pair.mykeypair.key_name]
  tags                        = local.tags
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