# Sessions

Get console on instance from AWSCLI.

```
aws ssm start-session --target i-123456789012345
```

## EC2 Instance Role to enable Sessions

Ensure your instance role has the right permissions.

[example-ec2-instance-role-for-ssm-sessions](example-ec2-instance-role-for-ssm-sessions.md)
## Install Session Manager plugin on Linux

- [(Optional) Install the Session Manager plugin for the AWS CLI - AWS Systems Manager (docs.aws.amazon.com)](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-verify)

Test plugin is installed:

```shell
session-manager-plugin
```

Install:

```shell
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo yum install -y session-manager-plugin.rpm
```

## Remove Session Manager plugin

```shell
yum erase session-manager-plugin -y
```

