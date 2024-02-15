provider "aws"{
    region="ap-northeast-1"
}
resource "aws_vpc" "vpc"{
    tags = {
      Name="my-vpc"
   }    
    cidr_block = var.vpc_cidr
}
resource "aws_subnet" "private-subnet" {
  tags = {
    Name = "pvt-subnet"
  }
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pvt_cidr
}
resource "aws_subnet" "public-subnet" {
  tags = {
    Name = "pub-subnet"
  }
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.pub_cidr
  map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "igw" {
     tags = {
      Name ="my-igw"
    }
    vpc_id = aws_vpc.vpc.id
}
resource "aws_route" "route" {
  route_table_id = aws_vpc.vpc.default_route_table_id
  gateway_id = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}
resource "aws_security_group" "sg" {
    name ="my-sg"
    description = "allow only ssh"
    vpc_id = aws_vpc.vpc.id
    ingress {
        protocol = "TCP"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    depends_on = [ aws_internet_gateway.igw ]
}
resource "aws_instance" "inst-1" {
    tags = {
        Name ="pvt-inst-1"
    }
    ami = var.ami_id
    instance_type = var.inst_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = aws_subnet.private-subnet.id
}
resource "aws_instance" "inst-2" {
    tags = {
        Name ="pub-inst-1"
    }
    ami = var.ami_id
    instance_type = var.inst_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = aws_subnet.public-subnet.id
}