output "instance_ids" {
  description = "Worker instance IDs"
  value       = alicloud_instance.worker.*.id
}

output "public_ips" {
  description = "Worker public IPs"
  value       = alicloud_eip.worker_eip.*.ip_address
}

output "private_ips" {
  description = "Worker private IPs"
  value       = alicloud_instance.worker.*.private_ip
}