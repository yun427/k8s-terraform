output "controller_public_ip" {
  description = "Controller public IP"
  value       = module.controller.public_ip
}

output "worker_public_ips" {
  description = "Worker public IPs"
  value       = module.workers.public_ips
}

output "controller_private_ip" {
  description = "Controller private IP"
  value       = module.controller.private_ip
}

output "worker_private_ips" {
  description = "Worker private IPs"
  value       = module.workers.private_ips
}

output "ssh_user" {
  description = "SSH login user"
  value       = "root"
}

output "kubeconfig_command" {
  description = "Command to retrieve kubeconfig"
  value       = "ssh root@${module.controller.public_ip} 'cat /etc/kubernetes/admin.conf' > kubeconfig"
}