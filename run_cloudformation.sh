cd CloudFormation
aws cloudformation create-stack --stack-name petclinic --region eu-west-3 --template-body file://network.yml --parameters file://network.json --capabilities CAPABILITY_NAMED_IAM