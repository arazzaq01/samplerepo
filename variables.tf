# Define variables for AWS account IDs
variable "aws_1_0_account_id" {
  description = "AWS 1.0 Account ID where the default event bus resides"
  type        = string
}

variable "aws_2_0_account_id" {
  description = "AWS 2.0 Account ID where the EventBridge rule will be created"
  type        = string
}

# IAM Role to allow EventBridge rule in AWS 2.0 to send events to AWS 1.0
resource "aws_iam_role" "eventbridge_role" {
  name = "EventBridgeRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy to allow putting events to the AWS 1.0 event bus
resource "aws_iam_policy" "eventbridge_policy" {
  name        = "EventBridgePolicy"
  description = "Allows EventBridge rule to put events on the AWS 1.0 event bus"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "events:PutEvents"
        Resource = "arn:aws:events:${var.aws_1_0_account_id}:event-bus/default"
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "eventbridge_policy_attachment" {
  role       = aws_iam_role.eventbridge_role.name
  policy_arn = aws_iam_policy.eventbridge_policy.arn
}
