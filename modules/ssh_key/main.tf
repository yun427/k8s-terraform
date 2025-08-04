resource "alicloud_key_pair" "k8s_key" {
  key_pair_name = "k8s-ssh-key-${sha1(var.public_key)}"  # 直接使用公钥内容生成哈希
  public_key    = var.public_key  # 直接使用传入的公钥内容
}