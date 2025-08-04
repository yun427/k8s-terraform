variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key pair name"
}

variable "instance_type" {
  description = "ECS instance type"
  default     = "ecs.g6.large"
}

variable "image_id" {
  description = "Custom image ID"
  default     = ""
}

variable "system_disk_size" {
  description = "System disk size in GB"
  default     = 40
}

variable "tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}
variable "vswitch_id" {
  description = "VSwitch ID for the instance"
}