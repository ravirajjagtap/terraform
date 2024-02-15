variable "username" {
  default = ravi
}

output "username" {
  value = "hello ${var.username}"
}