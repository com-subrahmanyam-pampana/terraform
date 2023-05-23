data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "lambda_sqs_role_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "app.js"
  output_path = "lambda_function_payload.zip"
}

# resource "aws_sqs_queue" "terraform_queue_deadletter" {
#   name = "terraform-example-deadletter-queue"
#   redrive_allow_policy = jsonencode({
#     redrivePermission = "byQueue",
#     sourceQueueArns   = [aws_sqs_queue.ses_bounces_queue.arn]
#   })
# }
resource "aws_sqs_queue" "ses_bounces_queue" {
  name                      = "terraform-example-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
#   redrive_policy = jsonencode({
#     deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
#     maxReceiveCount     = 4
#   })

  tags = {
    Environment = "production"
  }
}


resource "aws_lambda_event_source_mapping" "example" {
  event_source_arn = aws_sqs_queue.ses_bounces_queue.arn
  function_name    = aws_lambda_function.test_lambda.arn
}
resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "app.lambdaHandler"
  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}