output "iam_role_arn" {
  value       = aws_iam_role.eexample_role.arn
  description = "作成するIAMロールのARN"
}

output "iam_role_id" {
  value       = aws_iam_role.example_role.id
  description = "作成するIAMロールのID"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.sandbox_bucket.arn
  description = "作成するS3バケットのARN"
}
