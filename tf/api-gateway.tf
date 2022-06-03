
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


