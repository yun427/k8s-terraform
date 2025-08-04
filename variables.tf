variable "access_key" {
  description = "AliCloud Access Key"
  sensitive   = true
}

variable "secret_key" {
  description = "AliCloud Secret Key"
  sensitive   = true
}

variable "region" {
  description = "AliCloud region"
  default     = "cn-hangzhou"
}

variable "vpc_id" {
  description = "VPC ID"
  default     = ""
}

variable "vswitch_id" {
  description = "VSwitch ID"
  default     = ""
}

variable "public_key_path" {
  description = "Path to SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "instance_type" {
  description = "Controller instance type"
  default     = "ecs.g6.large"
}

variable "worker_instance_type" {
  description = "Worker instance type"
  default     = "ecs.g6.xlarge"
}

variable "worker_count" {
  description = "Number of worker nodes"
  default     = 2
}

variable "image_id" {
  description = "Custom image ID"
  default     = ""
}

variable "controller_disk_size" {
  description = "Controller disk size (GB)"
  default     = 40
}

variable "worker_disk_size" {
  description = "Worker disk size (GB)"
  default     = 80
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
variable "create_vpc" {
  description = "Whether to create a new VPC"
  type        = bool
  default     = true
}

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
variable "internal_cidr_block" {
  description = "CIDR block for internal cluster communication"
  default     = "172.16.0.0/12"
}
variable "public_key" {
  description = "Content of SSH public key"
  type        = string
  default     = ""  # 建议留空，强制用户输入
}