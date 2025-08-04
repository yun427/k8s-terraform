# 条件创建 VPC 和 VSwitch
module "vpc" {
  source = "./modules/vpc"
  count  = var.create_vpc ? 1 : 0

  vpc_name     = var.vpc_name
  vpc_cidr     = var.vpc_cidr
  vswitch_name = var.vswitch_name
  vswitch_cidr = var.vswitch_cidr
  zone_id      = var.zone_id
}

# 使用本地值处理 VPC/VSwitch ID
locals {
  vpc_id     = var.vpc_id != "" ? var.vpc_id : (length(module.vpc) > 0 ? module.vpc[0].vpc_id : "")
  vswitch_id = var.vswitch_id != "" ? var.vswitch_id : (length(module.vpc) > 0 ? module.vpc[0].vswitch_id : "")
}

module "ssh_key" {
  source        = "./modules/ssh_key"
  public_key    = var.public_key  # 使用新变量名
}
module "security_group" {
  source            = "./modules/security_group"
  vpc_id            = local.vpc_id
  allowed_cidr_blocks = var.allowed_cidr_blocks
  internal_cidr_block = var.internal_cidr_block  # 添加这一行
}

module "controller" {
  source          = "./modules/controller"
  security_groups = [module.security_group.sg_id]
  key_name        = module.ssh_key.key_name
  instance_type   = var.instance_type
  image_id        = var.image_id
  system_disk_size = var.controller_disk_size
  vswitch_id      = local.vswitch_id
  tags            = var.tags
}

module "workers" {
  source          = "./modules/workers"
  worker_count    = var.worker_count
  security_groups = [module.security_group.sg_id]
  key_name        = module.ssh_key.key_name
  instance_type   = var.worker_instance_type
  image_id        = var.image_id
  system_disk_size = var.worker_disk_size
  vswitch_id      = local.vswitch_id
  tags            = var.tags
}