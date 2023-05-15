variable "vpc_name" {
  description = "Tag Name to be assigned with VPC"
  type        = string
  default     = "tcw_vpc"
}

variable "default_security_group_name" {
  description = "Enter the name for security group"
  type        = string
  default     = null
}
variable "create_igw" {
  description = "Whether IGW needs to be created"
  type        = bool
  default     = null
}
variable "igw_tag" {
  description = "Mention Tag needs to be associated with internet gateway"
  type        = string
  default     = "tcw_igw"
}