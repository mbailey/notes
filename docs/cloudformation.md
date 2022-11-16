# AWS CloudFormation

References:

- [aws docs](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [aws-labs / aws-cloudformation-templates](https://github.com/awslabs/aws-cloudformation-templates)

---

## Tools

[awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

[bash-my-aws](https://github.com/bash-my-aws/bash-my-aws)

    $ git clone https://github.com/bash-my-aws/bash-my-aws.git ${BMA_HOME:-$HOME/.bash-my-aws}


Utilities

    pip install cfn-flip cfn-lint


VSCode Extensions

[CloudFormation](https://github.com/aws-scripting-guy/cform-VSCode)
- create new YAML doc
- type start
- start typing resource name and hit TAB

[CloudFormation Linter](https://github.com/aws-cloudformation/cfn-lint-visual-studio-code)


## Cloudformation Templates

Simplest stack
``` yaml
# noop.yml
Resources:
  WaitConditionHandle:
    Type: AWS::CloudFormation::WaitConditionHandle
```

Create stack

    stack-create simplest.yml

[cfn-flip](https://github.com/awslabs/aws-cfn-template-flip)

## drift

- describe-stack-drift-detection-status
- describe-stack-resource-drifts
- detect-stack-drift
- detect-stack-resource-drift
- detect-stack-set-drift

