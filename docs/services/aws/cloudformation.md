# AWS CloudFormation

References:

- [aws docs](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [aws-labs / aws-cloudformation-templates](https://github.com/awslabs/aws-cloudformation-templates)

- [Add support for cf and codepipeline parameters file to cf deploy by vz10 · Pull Request 5443 · awsaws-cli (github.com)](https://github.com/aws/aws-cli/pull/5443)

---

## Tools

[awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

[bash-my-aws](https://github.com/bash-my-aws/bash-my-aws)

    $ git clone https://github.com/bash-my-aws/bash-my-aws.git ${BMA_HOME:-$HOME/.bash-my-aws}


**Utilities:**

```shell
pip install cfn-flip cfn-lint pydot
```


**VSCode Extensions:**
- [Create a AWS CloudFormation template using the AWS Toolkit for Visual Studio Code - AWS Toolkit for VS Code (docs.aws.amazon.com)](https://docs.aws.amazon.com/toolkit-for-vscode/latest/userguide/cloudformation-template.html):
    - [YAML - Visual Studio Marketplace (marketplace.visualstudio.com)](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
    - CloudFormation template:  File has a .yaml or .yml extension.
    - The file has a top-level `AWSTemplateFormatVersion` or **Resources** node.
    

###### SAM Template

- All of the criteria already described for CloudFormation
    
- The file has a top-level **Transform** node, containing a value that begins with `AWS::Serverless`.

- [CloudFormation Linter](https://github.com/aws-cloudformation/cfn-lint-visual-studio-code): Popular
- [CloudFormation](https://github.com/aws-scripting-guy/cform-VSCode)
    - Create new YAML doc
    - Type start
    - Start typing resource name and hit TAB



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

