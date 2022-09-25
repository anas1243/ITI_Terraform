data "aws_s3_bucket" "my-bucket" {
  bucket = "my-060389317043-bucket"
}
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}
resource "aws_iam_policy" "iam_policy_for_lambda" {
 
 name         = "aws_iam_policy_for_terraform_aws_lambda_role"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role"
 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_policy" "iam_policy_logs_for_lambda" {
 
 name         = "aws_iam_policy_for_terraform_aws_lambda_role_logs"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role logs"
 policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   }
 ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.iam_for_lambda.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_logs_to_iam_role" {
 role        = aws_iam_role.iam_for_lambda.name
 policy_arn  = aws_iam_policy.iam_policy_logs_for_lambda.arn
}

data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "python/"
output_path = "python/index.zip"
}



resource "aws_lambda_function" "test_lambda" {

  filename      = "python/index.zip"
  function_name = "send_SES_stateFile"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.lambda_handler"
  runtime = "python3.9"
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.my-bucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.my-bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.test_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}