# Creating IGW
resource "aws_internet_gateway" "Project_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_tag_name
    env = var.env_name
  }
}