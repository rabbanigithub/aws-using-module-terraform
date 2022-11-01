provider "aws" {
  region = local.region
}

locals {
  name   = "ex-${replace(basename(path.cwd), "_", "-")}"
  region = "us-east-2"

  user_data = <<-EOT
  #!/bin/bash
  sudo apt update
  sudo apt install  -y nginx
  sudo systemctl enable --now nginx
  EOT

  tags = {
    Name = local.name
  }
}
