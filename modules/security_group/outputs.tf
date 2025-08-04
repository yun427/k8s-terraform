output "sg_id" {
  description = "Security group ID"
  value       = alicloud_security_group.k8s_sg.id
}

output "sg_name" {
  description = "Security group name"
  value       = alicloud_security_group.k8s_sg.security_group_name
}