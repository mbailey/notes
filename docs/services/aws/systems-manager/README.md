# AWS Systems Manager

- [quick-setup](quick-setup.md)
- [fleet-manager](fleet-manager.md)
- [run-command](run-command.md)
- [Inventory](inventory.md)
- [SSH](ssh.md)
- [Sessions](sessions.md)

## Commands

**Connect to instance**:  `aws ssm start-session --target i-006b11ac03868d528`

## Run Command

```shell
aws ssm send-command --document-name "AWS-RunShellScript" --document-version "1" --targets '[{"Key":"InstanceIds","Values":["i-123456789012345"]}]' --parameters '{"workingDirectory":[""],"executionTimeout":["3600"],"commands":["date"]}' --timeout-seconds 600 --max-concurrency "50" --max-errors "0" --output-s3-bucket-name "bash-my-aws-demo" --region ap-southeast-2
```



