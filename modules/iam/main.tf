resource "aws_iam_role" "kops" {
  name = "kopsRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "kops_policy" {
  name       = "KopsPolicy"
  roles      = [aws_iam_role.kops.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
