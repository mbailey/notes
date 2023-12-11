# Example ec2 instance role for ssm sessions

These four are essential:

```shell
- 'ssmmessages:CreateControlChannel'
- 'ssmmessages:CreateDataChannel'
- 'ssmmessages:OpenControlChannel'
- 'ssmmessages:OpenDataChannel'
- ```

Here's my half baked (but working) EC2 Instance IAM Role:

```shell
  SSMRole:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Version: '2012-10-17'
        Statement:
          - Effect: Allow
            Principal:
              Service: ec2.amazonaws.com
            Action: 'sts:AssumeRole'
      Path: "/"
      Policies:
        - PolicyName: SSMInstancePolicy
          PolicyDocument:
            Version: '2012-10-17'
            Statement:
              - Effect: Allow
                Action:
                  - 'ssm:DescribeAssociation'
                  - 'ssm:GetDeployablePatchSnapshotForInstance'
                  - 'ssm:GetDocument'
                  - 'ssm:DescribeDocument'
                  - 'ssm:GetManifest'
                  - 'ssm:GetParameter'
                  - 'ssm:GetParameters'
                  - 'ssm:ListAssociations'
                  - 'ssm:ListInstanceAssociations'
                  - 'ssm:PutInventory'
                  - 'ssm:PutComplianceItems'
                  - 'ssm:PutConfigurePackageResult'
                  - 'ssm:UpdateAssociationStatus'
                  - 'ssm:UpdateInstanceAssociationStatus'
                  - 'ssm:UpdateInstanceInformation'
                  - 'ec2messages:GetEndpoint'
                  - 'ec2messages:GetMessages'
                  - 'ec2messages:SendReply'
                  - 'cloudwatch:PutMetricData'
                  - 'ssmmessages:CreateControlChannel'
                  - 'ssmmessages:CreateDataChannel'
                  - 'ssmmessages:OpenControlChannel'
                  - 'ssmmessages:OpenDataChannel'
                Resource: '*'
```