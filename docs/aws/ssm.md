# ssm plugin

- [(Optional) Install the Session Manager plugin for the AWS CLI - AWS Systems Manager (docs.aws.amazon.com)](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-verify)

## Install Session Manager plugin on Linux

Test plugin is installed:

```shell
session-manager-plugin
```

Install:

```shell
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo yum install -y session-manager-plugin.rpm
```

## Remove Session Manager

```shell
yum erase session-manager-plugin -y
```

## Start a session

```shell
aws ssm start-session --target instance-id
```


### SSH

- [Start an SSH session - AWS Systems Manager (docs.aws.amazon.com)](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#sessions-start-cli)

ssh -i /path/my-key-pair.pem username@instance-id


Requires >= `Amazon SSM Agent - Release 2.3.672.0 - 2019-07-09`
