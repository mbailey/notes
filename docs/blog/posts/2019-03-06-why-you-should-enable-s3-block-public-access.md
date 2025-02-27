---

title: Why You Should Enable S3 Block Public Access
date:
  created: 2019-03-05
comments: true
categories:
- systems
- aws
- s3
redirect_from: /2019/03/enable-s3-block-public-access/
---

Amazon S3 enables you to accidentally share confidential information with the world.
The potential impact of misconfiguration justifies implementing controls made available
by AWS in November 2018.

Numerous [data breaches][s3-leaks] due to misconfigured AWS Buckets have been
reported in recent times and [free tools][free-tools] have been released that
can be used to scan for them. Even AWS staff have [made their buckets world readable
by mistake][aws-staff].

[S3 Block Public Access][S3BPA] allows you to prevent configuration of S3 Buckets and the objects
within them from being accessible to the whole world.

It still allows you to share objects with specified targets such as:

- AWS Services
- other AWS Accounts
- specified IP address ranges

[s3-leaks]: https://github.com/nagwww/s3-leaks
[free-tools]: https://medium.com/@grayhatwarfare/how-to-search-for-open-amazon-s3-buckets-and-their-contents-https-buckets-grayhatwarfare-com-577b7b437e01
[S3BPA]: https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html
[aws-staff]: https://www.zdnet.com/article/aws-error-exposed-godaddy-server-secrets/?ref


## How we got here

Amazon S3 was the first AWS Service launched, way back in 2006. Users store
file objects in Buckets and can control access to them through a variety of
mechanisms, including:

- Bucket ACLs
- Object ACLs
- Bucket Policies
- IAM Polcies

Objects can be made accessable via:

- Unauthenticated Web requests (via http/https)
- AWS API calls (via AWS Web Console, AWSCLI, SDKs, etc)
- [BitTorrent](https://docs.aws.amazon.com/AmazonS3/latest/dev/S3Torrent.html)

Confusion around the different methods for controlling access can lead to
mistakes.  Amazon's "[only recommended use case][only-recommended] for the bucket
ACL is to grant write permission to the Amazon S3 Log Delivery group to write
access log objects to your bucket, yet Bucket ACLs still make it easy to make
the Bucket world readable (and even writable!).

[only-recommended]: https://docs.aws.amazon.com/AmazonS3/latest/dev/access-policy-alternatives-guidelines.html


## Detecting Publicly Accessible Buckets

AWS Trusted Advisor's [S3 Bucket Permissions Check][trusted-advisor] has been free since Feb 2018.

Business and Enterprise support customers can use these checks to enable
automated actions via Trusted Advisor's [integration with CloudWatch Events][integration].

[trusted-advisor]: https://www.amazonaws.cn/en/support/trustedadvisor/best-practices/
[integration]: http://docs.aws.amazon.com/awssupport/latest/user/cloudwatch-events-ta.html


## Block S3 Public Access

In Nov 2018, AWS launched a new feature that allows you to control against
Objects in S3 Buckets being made Public. It consists of four settings which can
be applied at the Bucket or Account level. Applying at a Bucket level may enable
the rules to be overridden.


Objects intended to be shared publicly (e.g. static websites) can have a Bucket
Policy with configured to grant read access to a CloudFront [Origin Access Identity][OAI].

For situations where CloudFront is considered overkill (it can take ~30 minutes to provision),
users may consider granting access to a specific IP Range, AWS Account or IAM Role.

[OAI]: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html#private-content-granting-permissions-to-oai


### What does `Public` mean

- ACLs: AllUsers or AuthenticatedUsers

- Policies

  In order to be considered non-public, a bucket policy must grant access only to
  fixed values (values that don't contain a wildcard) of one or more of the
  following:

  - A set of Classless Inter-Domain Routings (CIDRs), using aws:SourceIp. For
    more information about CIDR, see RFC 4632 on the RFC Editor website.
  - An AWS principal, user, role, or service principal
  - aws:SourceArn
  - aws:SourceVpc
  - aws:SourceVpce
  - aws:SourceOwner
  - aws:SourceAccount
  - s3:x-amz-server-side-encryption-aws-kms-key-id
  - aws:userid, outside the pattern "AROLEID:*"


## Enabling S3 Block Public Access on an Account

Applying S3 Block Public Access may break things! Administrators applying this
feature should familiarize themselves with the [AWS Documentation][aws-docs].

In order to perform Block Public Access operations on an account, use the AWS
CLI service s3control.

The four settings that can be configured independantly) are:

- **BlockPublicAcls**: Block setting of ACLs if they include public access
- **IgnorePublicAcls**: Ignore Public ACLs
- **BlockPublicPolicy**: Block setting of Policy that includes public access
- **RestrictPublicBuckets**: Restrict buckets with public Policy to same account
                         and AWS Principals


The account-level operations that use this service are:

- PUT PublicAccessBlock (for an account)
- GET PublicAccessBlock (for an account)
- DELETE PublicAccessBlock (for an account)


[aws-docs]: https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html


## Example CloudFormation for granting access to Origin Access Identity and IP range

```
  CFOAI:
    Type: AWS::CloudFront::CloudFrontOriginAccessIdentity
    Properties:
      CloudFrontOriginAccessIdentityConfig:
        Comment: !Ref AWS::StackName

  Bucket:
    Type: AWS::S3::Bucket

  BucketPolicy:
    Type: AWS::S3::BucketPolicy
    Properties:
      Bucket: !Ref Bucket
      PolicyDocument:
        Version: 2012-10-17
        Id: PolicyForCloudFrontPrivateContent
        Statement:
          - Sid: Grant a CloudFront Origin Identity access to support private content
            Action: "s3:GetObject"
            Effect: "Allow"
            Principal:
             CanonicalUser: !GetAtt CFOAI.S3CanonicalUserId
            Resource: !Sub "arn:aws:s3:::${Bucket}/*"
          - Sid: Grant access from Trusted Network
            Action: "s3:GetObject"
            Effect: "Allow"
            Principal: "*"
            Resource: !Sub "arn:aws:s3:::${Bucket}/*"
            Condition:
              IpAddress:
                aws:SourceIp: !Ref OfficeIp
```
