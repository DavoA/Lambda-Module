variable "function_name" {
  type        = string
  description = "The name of the Lambda function"
}

variable "handler" {
  type        = string
  description = "The entry point for the Lambda function, in the form of 'filename.method'"
}

variable "runtime" {
  type        = string
  description = "The runtime environment for the Lambda function"
}

resource "aws_iam_role" "lambda_role" {
        name = "lambda_role"
        assume_role_policy = jsonencode({
          "Version": "2012-10-17",
          "Statement": [
            {
              "Action": "sts:AssumeRole",
              "Principal": {
                "Service": "lambda.amazonaws.com"
              },
              "Effect": "Allow",
              "Sid": ""
            }
          ]
        })
}

resource "aws_lambda_function" "terraform_lambda_func" {
        filename                       = "${path.module}/python/hello.zip"
        function_name                  = var.function_name
        role                           = aws_iam_role.lambda_role.arn
        handler                        = var.handler
        runtime                        = var.runtime
}
