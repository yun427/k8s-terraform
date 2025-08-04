data "alicloud_images" "ubuntu" {
  most_recent = true
  owners      = "system" # 只查询官方镜像
  name_regex  = "^ubuntu_20_04.*64" # 使用更通用的20.04镜像
}

resource "alicloud_instance" "controller" {
  instance_name        = "k8s-controller"
  instance_type        = var.instance_type
  image_id             = var.image_id != "" ? var.image_id : data.alicloud_images.ubuntu.ids[0]
  security_groups      = var.security_groups
  key_name             = var.key_name
  internet_max_bandwidth_out = 100
  system_disk_category = "cloud_efficiency"
  system_disk_size     = var.system_disk_size
  vswitch_id           = var.vswitch_id
  
  tags = merge({
    Role = "controller"
    Name = "k8s-controller"
  }, var.tags)
}

resource "alicloud_eip" "controller_eip" {
  address_name = "k8s-controller-eip"
}

resource "alicloud_eip_association" "controller_eip_asso" {
  allocation_id = alicloud_eip.controller_eip.id
  instance_id   = alicloud_instance.controller.id
}
