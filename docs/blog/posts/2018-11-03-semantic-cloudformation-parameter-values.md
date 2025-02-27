---

title: Semantic CloudFormation Parameter Values
date: 
  created: 2018-11-03
comments: true
categories:
- aws
- cloudformation
---

Here's a **pure Cloudformation** solution to two annoyances I encounter when
managing AWS CloudFormation Parameters. It allows you to *optionally* specify
exported CloudFormation Output values in your CloudFormation Parameters.

Most resources I deploy on AWS are managed via CloudFormation using reusable
templates and custom Parameters. Configuring the Parameters often requires
looking up resource identifiers for VPCs, Subnets, Route Tables and the like.

Here are the Parameters for a stack that creates routes for a VPC Peering Connection:

```
[
  {
    "ParameterKey": "RemoteSubnet1CIDR",
    "ParameterValue": "10.0.38.0/24"
  },
  {
    "ParameterKey": "RemoteSubnet2CIDR",
    "ParameterValue": "10.0.39.0/24"
  },
  {
    "ParameterKey": "RouteTable1",
    "ParameterValue": "rtb-01234567"
  },
  {
    "ParameterKey": "RouteTable2",
    "ParameterValue": "rtb-12345678"
  },
  {
    "ParameterKey": "VpcPeeringConnection",
    "ParameterValue": "pcx-11111111111111111"
  }
]
```

### The Annoyances

I love CloudFormation but the file above annoys me for two reasons:

1. It doesn't convey much about these route tables or subnets

   These routes are for the `bma-prod` VPC to get to `internal` subnets on `failmode-prod`.
   In order to work that out you would need to lookup each value. That's toil.

2. I had to query AWS to find these values

   When creating the Parameters file for the `non-prod` account, I would need to lookup
   all these values again. That's toil.


### Semantic CloudFormation Parameter Values

The VPCs I deploy export [Stack Output][stack outputs] values that can be imported by other Stacks.
These are given unique names by prepending the stack name to the value identifer.

I resolved both annoyances above by updating my Parameters file to refer to these values:

```
[
  {
    "ParameterKey": "RemoteSubnet1CIDR",
    "ParameterValue": "import:vpc-failmode-prod-SUBNETINTERNAL1CIDR"
  },
  {
    "ParameterKey": "RemoteSubnet2CIDR",
    "ParameterValue": "import:vpc-failmode-prod-SUBNETINTERNAL2CIDR"
  },
  {
    "ParameterKey": "RouteTable1",
    "ParameterValue": "import:vpc-bma-prod-RTBPRIVATE1"
  },
  {
    "ParameterKey": "RouteTable2",
    "ParameterValue": "import:vpc-bma-prod-RTBPRIVATE2"
  },
  {
    "ParameterKey": "VpcPeeringConnection",
    "ParameterValue": "pcx-11111111111111111"
  }
]
```

### Adding Support to the Stack Template

This pure CloudFormation pattern supports both of the Parameter styles shown above. We define some
conditions that look for `import:` at the start of a Parameter value and this
determines whether it should be imported or simply used as a string.

```
AWSTemplateFormatVersion: '2010-09-09'
Description: VPC Peering Routes
Parameters:
  VpcPeeringConnection:
    AllowedPattern: ^pcx-[a-f0-9]+$
    ConstraintDescription: Must be a valid VPC peering ID
    Description: VPC Peering connection ID
    MinLength: '12'
    MaxLength: '21'
    Type: String
  RemoteSubnet1CIDR:
    Description: CIDR range of Remote Internal subnet 1
    Type: String
  RemoteSubnet2CIDR:
    Description: CIDR range of Remote Internal subnet 2
    Type: String
  RouteTable1:
    Description: Local Route Table 1
    Type: String
  RouteTable2:
    Description: Local Route Table 2
    Type: String

Conditions:
  ImportRemoteSubnet1CIDR: !Equals [ "import", !Select [ 0, !Split [ ":", !Ref RemoteSubnet1CIDR ] ] ]
  ImportRemoteSubnet2CIDR: !Equals [ "import", !Select [ 0, !Split [ ":", !Ref RemoteSubnet2CIDR ] ] ]
  ImportRouteTable1:       !Equals [ "import", !Select [ 0, !Split [ ":", !Ref RouteTable1 ] ] ]
  ImportRouteTable2:       !Equals [ "import", !Select [ 0, !Split [ ":", !Ref RouteTable2 ] ] ]

Resources:

  RouteTable1ToRemoteSubnet1:
    Type: AWS::EC2::Route
    Properties:
      DestinationCidrBlock: !If
        - ImportRemoteSubnet1CIDR
        - Fn::ImportValue: !Select [ 1, !Split [ ":", !Ref RemoteSubnet1CIDR ] ]        
        - !Ref 'RemoteSubnet1CIDR'
      RouteTableId: !If
        - ImportRouteTable1
        - Fn::ImportValue: !Select [ 1, !Split [ ":", !Ref RouteTable1 ] ]        
        - !Ref 'RouteTable1'
      VpcPeeringConnectionId: !Ref 'VpcPeeringConnection'
```


### Conclusion

I like this pattern because it:
- makes it easier to create and read parameter files
- doesn't have any external dependancies
- also supports specifying resource ids as strings

Feedback welcome in the comments.


[stack outputs]: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html 
