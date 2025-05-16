
data "aws_iam_policy_document" "test_policy" {
  statement {
    actions = ["s3:ListBucket"]
    resources = [
      aws_s3_bucket.sandbox_bucket.arn,
    ]
  }
}
resource "aws_iam_role" "tfc_role" {
  name = "test_role_from_account"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name = "test"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = ["s3:*"]
          Effect = "Allow"
          Resource = [
            "${aws_s3_bucket.sandbox_bucket.arn}/*",
            "${aws_s3_bucket.sandbox_bucket.arn}"
          ]
        },
      ]
    })
  }
}
