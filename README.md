# lambda-modules
Test if AWS Lambda may have modules in subfolders

## Well they can but ...
The project with subfolders is legitimate. If you zip the index.js and modules/ files you can uploaded it to an existing Lambda function with a command similar to:

```
aws lambda update-function-code --region eu-west-1 --function-name lambda-modules --zip-file fileb://tmp.zip
```

and it will work in the majority of cases. However ...

## There is probably a bug in Lambda ZIP decompress
If you use PowerShell ZIP capability by using the PS1 script and workflow similar to:

```
mkdir tmp
xcopy /Y *.js tmp\
xcopy /Y/S/I modules tmp\modules
Powershell.exe -executionpolicy ByPass -File zipTmp.ps1
aws lambda update-function-code --region eu-west-1 --function-name lambda-modules --zip-file fileb://tmp.zip
```
then you are heading for trouble. Upload will succeed but Lambda invocations will fail with utterly incomprehensible messages like:

```
Service error.
```

Also what is sent to CloudWatch logs doesn't help, only the strange, orphaned entries with neither creation date nor content.





