
let response;
exports.lambdaHandler = async (event, context) => {
    const body=JSON.parse(event.body)
    try {
        response = {
            'statusCode': 200,
            'body': JSON.stringify({
                message: 'Hello This is from Terraform Lambda',
            })
        }
    } catch (err) {
        console.log(err);
        return err;
    }
    return response
};
