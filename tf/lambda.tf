
resource "aws_lambda_function" "c_sharp_lambda" {
  filename      = "BlogFunction.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "BlogFunction::BlogFunction.Function::FunctionHandler"
  source_code_hash = filebase64sha256("BlogFunction.zip")

  runtime = "dotnet6"
  
}