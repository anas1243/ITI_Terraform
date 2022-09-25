import boto3
from botocore.exceptions import ClientError

def send_email():
    SENDER = "anas.katoot@gmail.com" # must be verified in AWS SES Email
    RECIPIENT = "anas1243@gmail.com" # must be correct email

    # If necessary, replace us-west-2 with the AWS Region you're using for Amazon SES.
    AWS_REGION = "us-east-1"

    # The subject line for the email.
    SUBJECT = "Regarding terraform state file update!"

    # The email body for recipients with non-HTML email clients.
    BODY_TEXT = ("Hello All,\r\n"
                "Kindly know that the state file has been updated!! "
                )

    # Create a new SES resource and specify a region.
    client = boto3.client('ses',region_name=AWS_REGION)

    # Try to send the email.
    try:
        #Provide the contents of the email.
        response = client.send_email(
            Destination={
                'ToAddresses': [
                    RECIPIENT
                ]
            },
            Message={
                'Body': {
                    'Text': {
        
                        'Data': BODY_TEXT
                    },
                },
                'Subject': {

                    'Data': SUBJECT
                },
            },
            Source=SENDER
        )
    # Display an error if something goes wrong.	
    except ClientError as e:
        print(e.response['Error']['Message'])
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])

def lambda_handler(event, context):
    # TODO implement
    send_email()