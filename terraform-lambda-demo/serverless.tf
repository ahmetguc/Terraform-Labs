provider "aws" {
  region = "us-west-2"
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda1"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  source_path = "lambda-function1"

  tags = {
    Name = "my-lambda1"
  }

}