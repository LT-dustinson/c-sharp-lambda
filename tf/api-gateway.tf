
###########################################################
# Create an API in API Gateway
###########################################################
resource "aws_api_gateway_rest_api" "csharp-api" {
  name               = "csharp-api"
  description        = "Sample CSharp API"
  binary_media_types = ["image/png"]
}

###########################################################
# Add a /hello resource to the gateway
###########################################################
resource "aws_api_gateway_resource" "resource" {
  path_part   = "hello"
  parent_id   = aws_api_gateway_rest_api.csharp-api.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.csharp-api.id
}

###########################################################
# Add a GET method to the  /hello resource
###########################################################
resource "aws_api_gateway_method" "csharp-api" {
  rest_api_id   = aws_api_gateway_rest_api.csharp-api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = "NONE"
}

###########################################################
# Integrate the GET /hello with the lambda
###########################################################
resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.csharp-api.id
  resource_id             = aws_api_gateway_resource.resource.id
  http_method             = aws_api_gateway_method.csharp-api.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.c_sharp_lambda.invoke_arn
}


###########################################################
# Grant access to the lambda from the gateway
###########################################################
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.c_sharp_lambda.function_name
  principal     = "apigateway.amazonaws.com"


  source_arn = "arn:aws:execute-api:${var.region}:${var.aws_account}:${aws_api_gateway_rest_api.csharp-api.id}/*/${aws_api_gateway_method.csharp-api.http_method}${aws_api_gateway_resource.resource.path}"
}

###########################################################
# Add a stage so the the api is accessible
###########################################################
resource "aws_api_gateway_deployment" "test_gateway_deployment" {
  depends_on  = [aws_api_gateway_integration.integration]
  rest_api_id = aws_api_gateway_rest_api.csharp-api.id
  stage_name  = "prod"
}