# SSH

- [Start an SSH session - AWS Systems Manager (docs.aws.amazon.com)](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#sessions-start-cli)

ssh -i /path/my-key-pair.pem username@instance-id


Requires >= `Amazon SSM Agent - Release 2.3.672.0 - 2019-07-09`

## Port Forwarding


- [New – Port Forwarding Using AWS System Manager Session Manager  AWS News Blog (aws.amazon.com)](https://aws.amazon.com/blogs/aws/new-port-forwarding-using-aws-system-manager-sessions-manager/)

```console
aws ssm start-session \
  --target i-123456789012345678 \
  --document-name AWS-StartPortForwardingSession \
  --parameters "localPortNumber=55678,portNumber=3389"
```