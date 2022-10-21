provider "aws" {
  region = local.region
}

locals {
  name   = "ex-${replace(basename(path.cwd), "_", "-")}"
  region = "us-east-2"

  tags = {
    Name  = local.name
  }
}
