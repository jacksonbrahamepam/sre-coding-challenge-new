module "vpc" {
  source     = "../../module/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source            = "../../module/subnet"
  availability_zone = "us-east-1a"
  public_snet_cidr  = "10.0.0.0/24"
  vpc_id            = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "../../module/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route" {
  source      = "../../module/route_table"
  vpc_id      = module.vpc.vpc_id
  gateway_id  = module.internet_gateway.ig_id
  public_snet = module.subnet.public_subnet_id
}

module "security_group" {
  source = "../../module/security_group"
  vpc_id = module.vpc.vpc_id
}

module "webserver" {
  source         = "../../module/ec2_instance"
  ami            = "ami-04505e74c0741db8d"
  instance_type  = "t2.micro"
  snet           = module.subnet.public_subnet_id
  security_group = module.security_group.security_group_id
}