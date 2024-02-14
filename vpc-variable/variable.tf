variable "ami_id" {
  default = "ami-07c589821f2b353aa"
}
variable "inst_type" {
  default ="t2.micro"
}
variable "key_pair" {
  default = "tokyo-key"
}
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}
variable "pvt_cidr" {
  default = "192.168.0.0/20"
}
variable "pub_cidr" {
  default = "192.168.16.0/20"
}