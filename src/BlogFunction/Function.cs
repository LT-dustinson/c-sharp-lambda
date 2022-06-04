using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.SystemTextJson.DefaultLambdaJsonSerializer))]

namespace BlogFunction;

public class Function 
{
    public APIGatewayProxyResponse FunctionHandler(APIGatewayProxyRequest request, ILambdaContext lambdaContext)
    {
        var response = new APIGatewayProxyResponse
        {
            StatusCode = 200,
            Body = "Hello World "   //testing
        };
        return response;
    }
}