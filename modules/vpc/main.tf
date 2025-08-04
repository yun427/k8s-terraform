resource "alicloud_vpc" "vpc" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "vsw" {
  vswitch_name = var.vswitch_name
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = var.vswitch_cidr
  zone_id      = var.zone_id
}