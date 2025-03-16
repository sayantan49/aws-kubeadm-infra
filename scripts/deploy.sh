#!/bin/bash
set -e  # Exit if any command fails

echo "🚀 Installing Kops..."
curl -Lo kops https://github.com/kubernetes/kops/releases/latest/download/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/
kops version

echo "🚀 Fetching AWS Resource Details..."

# Fetch Master Node Public IP
MASTER_IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=k8s-master" --query "Reservations[*].Instances[*].PublicIpAddress" --output text)

# Fetch Worker Node Public IPs
WORKER_IPS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=k8s-worker-*" --query "Reservations[*].Instances[*].PublicIpAddress" --output text)

echo "✅ KOPS_STATE_STORE: $KOPS_STATE_STORE"
echo "✅ VPC ID: $VPC_ID"
echo "✅ Subnet IDs: $SUBNET_IDS"
echo "✅ Master Node IP: $MASTER_IP"
echo "✅ Worker Node IPs: $WORKER_IPS"

# Export Kops state store
export KOPS_STATE_STORE=$KOPS_STATE_STORE

# Create Kops Cluster
echo "🚀 Creating Kops cluster..."
kops create cluster --name=k8s-cluster.k8s.local \
  --state=$KOPS_STATE_STORE \
  --vpc=$VPC_ID \
  --subnets=$SUBNET_IDS \
  --node-count=2 \
  --node-size=t3.medium \
  --master-size=t3.medium \
  --ssh-public-key=~/.ssh/id_rsa.pub

# Apply Kops Cluster
echo "⏳ Applying Kops cluster..."
kops update cluster k8s-cluster.k8s.local --yes --state=$KOPS_STATE_STORE

# Validate Kubernetes Cluster
echo "🔍 Validating Kubernetes cluster..."
kops validate cluster --state=$KOPS_STATE_STORE

echo "🎉 Kops Cluster is ready!"
