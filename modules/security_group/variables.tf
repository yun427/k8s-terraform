variable "vpc_id" {
  description = "VPC ID where security group will be created"
  default     = ""
}

variable "sg_name" {
  description = "Security group name"
  default     = "k8s-cluster-sg"
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access the cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "internal_cidr_block" {
  description = "CIDR block for internal cluster communication"
  default     = "172.16.0.0/12"
}