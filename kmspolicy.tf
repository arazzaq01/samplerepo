data "aws_kms_key" "kms_key" {
  key_id = var.kms_key_id
}

resource "aws_kms_key_policy" "kms_key_policy" {
  key_id = data.aws_kms_key.kms_key.key_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowDecryptAccess"
        Effect   = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_1_0_account_id}:role/ConnectDirectRole"
        }
        Action   = [
          "kms:Decrypt",
          "kms:DescribeKey"
        ]
        Resource = "*"
      }
    ]
  })
}
