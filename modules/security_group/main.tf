resource "alicloud_security_group" "k8s_sg" {
  security_group_name   = var.sg_name
  vpc_id = var.vpc_id != "" ? var.vpc_id : null
}

resource "alicloud_security_group_rule" "allow_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "22/22"
  cidr_ip           = var.allowed_cidr_blocks[0]
  security_group_id = alicloud_security_group.k8s_sg.id
}

resource "alicloud_security_group_rule" "allow_k8s_api" {
  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "6443/6443"
  cidr_ip           = var.allowed_cidr_blocks[0]
  security_group_id = alicloud_security_group.k8s_sg.id
}

resource "alicloud_security_group_rule" "allow_node_ports" {
  type              = "ingress"
  ip_protocol       = "tcp"
  port_range        = "30000-32767/30000-32767"
  cidr_ip           = var.allowed_cidr_blocks[0]
  security_group_id = alicloud_security_group.k8s_sg.id
}

resource "alicloud_security_group_rule" "allow_all_internal" {
  type              = "ingress"
  ip_protocol       = "all"
  port_range        = "-1/-1"
  cidr_ip           = var.internal_cidr_block  # 使用变量
  security_group_id = alicloud_security_group.k8s_sg.id
}