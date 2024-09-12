# modules/security/variables.tf
variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}
