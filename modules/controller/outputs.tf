output "instance_id" {
  description = "Controller instance ID"
  value       = alicloud_instance.controller.id
}

output "public_ip" {
  description = "Controller public IP"
  value       = alicloud_eip.controller_eip.ip_address
}

output "private_ip" {
  description = "Controller private IP"
  value       = alicloud_instance.controller.private_ip
}