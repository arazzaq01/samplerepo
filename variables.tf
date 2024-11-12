variable "aws_1_0_account_id" {
  description = "AWS 1.0 Account ID where the default event bus resides"
  type        = string
}

variable "aws_2_0_account_id" {
  description = "AWS 2.0 Account ID where the EventBridge rule will be created"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name in AWS 2.0 to be accessed by Connect Direct in AWS 1.0"
  type        = string
}

variable "kms_key_id" {
  description = "KMS Key ID in AWS 2.0 for encryption, accessible by AWS 1.0 Connect Direct"
  type        = string
}
