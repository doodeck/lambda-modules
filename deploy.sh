#

zip -r tmp.zip index.js modules/
aws --profile lambda --region eu-west-1 lambda update-function-code --function-name lambda-modules --zip-file fileb://tmp.zip
