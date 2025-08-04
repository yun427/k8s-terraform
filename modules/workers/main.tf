data "alicloud_images" "ubuntu" {
  most_recent = true
  owners      = "system" # 只查询官方镜像
  name_regex  = "^ubuntu_20_04.*64" # 使用更通用的20.04镜像
}

resource "alicloud_instance" "worker" {
  count               = var.worker_count
  instance_name       = "k8s-worker-${count.index}"
  instance_type       = var.instance_type
  image_id            = var.image_id != "" ? var.image_id : data.alicloud_images.ubuntu.ids[0]
  security_groups     = var.security_groups
  key_name            = var.key_name
  internet_max_bandwidth_out = 100
  system_disk_category = "cloud_efficiency"
  system_disk_size    = var.system_disk_size
  vswitch_id          = var.vswitch_id
  
  tags = merge({
    Role = "worker"
    Name = "k8s-worker-${count.index}"
  }, var.tags)
}

resource "alicloud_eip" "worker_eip" {
  count        = var.worker_count
  address_name = "k8s-worker-${count.index}-eip"
}

resource "alicloud_eip_association" "worker_eip_asso" {
  count        = var.worker_count
  allocation_id = alicloud_eip.worker_eip[count.index].id
  instance_id   = alicloud_instance.worker[count.index].id
}