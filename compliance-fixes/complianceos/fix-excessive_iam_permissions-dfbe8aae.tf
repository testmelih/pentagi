resource "aws_iam_role_policy" "yml_least_privilege" {
  name = "yml-least-privilege"
  role = aws_iam_role.yml.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = [
        # Specify only required actions — ComplianceOS auto-remediation
        "s3:GetObject",
        "s3:PutObject"
      ]
      Resource = "arn:aws:s3:::your-bucket/*"
    }]
  })
}