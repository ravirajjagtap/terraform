variable "username" {

}

output "username" {
  value = "hello ${var.username}"
}