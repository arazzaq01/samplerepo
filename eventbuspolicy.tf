resource "aws_cloudwatch_event_bus_policy" "allow_aws_2_0_account" {
  event_bus_name = "default"
  statement_id   = "AllowAWS2_0AccountToPutEvents"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_2_0_account_id}:root"
        }
        Action    = "events:PutEvents"
        Resource  = "arn:aws:events:${var.aws_1_0_account_id}:event-bus/default"
      }
    ]
  })
}
