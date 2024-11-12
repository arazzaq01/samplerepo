resource "aws_cloudwatch_event_rule" "s3_object_events" {
  name        = "S3ObjectEvents"
  description = "Rule to forward S3 object events to AWS 1.0 default event bus"
  event_pattern = jsonencode({
    "source": ["aws.s3"],
    "detail-type": ["Object Created"]
  })
}

resource "aws_cloudwatch_event_target" "s3_event_target" {
  rule = aws_cloudwatch_event_rule.s3_object_events.name
  arn  = "arn:aws:events:${var.aws_1_0_account_id}:event-bus/default"
  role_arn = aws_iam_role.eventbridge_role.arn
}
