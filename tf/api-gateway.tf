
resource "aws_api_gateway_rest_api" "csharp-api" {
  name               = "csharp-api"
  description        = "Sample CSharp API"
  binary_media_types = ["image/png"]
}
