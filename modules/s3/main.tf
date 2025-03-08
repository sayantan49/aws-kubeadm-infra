resource "aws_s3_bucket" "kops_state_sayantan49" {
  bucket = "kops-cluster-state-sayantan49"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Kops State Store"
    Environment = "Dev"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.kops_state_sayantan49.id
}

output "kops_state_store" {
  value = "s3://${aws_s3_bucket.kops_state_sayantan49.id}"
}
