resource "null_resource" "install_kops" {
  provisioner "local-exec" {
    command = <<EOT
curl -Lo kops https://github.com/kubernetes/kops/releases/latest/download/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/
EOT
  }
}

resource "null_resource" "kops_cluster" {
  depends_on = [null_resource.install_kops]

  provisioner "local-exec" {
    command = <<EOT
export KOPS_STATE_STORE=s3://${var.s3_bucket}
kops create cluster --name=k8s-cluster.k8s.local \
  --state=$KOPS_STATE_STORE \
  --vpc=${var.vpc_id} \
  --subnets=${join(",", var.subnet_ids)} \
  --zones=eu-north-1a,eu-north-1b \
  --node-count=2 \
  --node-size=t3.medium \
  --master-size=t3.medium \
  --ssh-public-key=${var.ssh_key_path} \
  --dns-zone=k8s.local

kops update cluster k8s-cluster.k8s.local --yes --state=$KOPS_STATE_STORE
EOT
  }
}
