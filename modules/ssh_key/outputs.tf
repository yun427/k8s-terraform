output "key_name" {
  description = "Name of the SSH key pair"
  value       = alicloud_key_pair.k8s_key.key_pair_name
}

output "key_id" {
  description = "ID of the SSH key pair"
  value       = alicloud_key_pair.k8s_key.id
}