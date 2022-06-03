
resource "aws_api_gateway_rest_api" "csharp-api" {
  name               = "csharp-api"
  description        = "Sample CSharp API"
  binary_media_types = ["image/png"]
}


resource "aws_api_gateway_resource" "resource" {
  path_part   = "hello"
  parent_id   = aws_api_gateway_rest_api.csharp-api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.csharp-api.id
}


resource "aws_api_gateway_method" "csharp-api" {
  rest_api_id   = aws_api_gateway_rest_api.csharp-api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.csharp-api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.csharp-api.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.c_sharp_lambda.invoke_arn
}