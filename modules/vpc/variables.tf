variable "vpc_name" {
  description = "VPC name"
  default     = "k8s-vpc"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "172.16.0.0/16"
}

variable "vswitch_name" {
  description = "VSwitch name"
  default     = "k8s-vswitch"
}

variable "vswitch_cidr" {
  description = "VSwitch CIDR block"
  default     = "172.16.1.0/24"
}

variable "zone_id" {
  description = "Availability zone ID"
  default     = "cn-hangzhou-g"
}