using Amazon.Lambda.Core;

// Assembly attribute to enable the Lambda function's JSON input to be converted into a .NET class.
[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.SystemTextJson.DefaultLambdaJsonSerializer))]

namespace BlogFunction;

public class Function
{
    
    public string FunctionHandler(string input, ILambdaContext context)
    {
        return "Hello World";
    }
}
