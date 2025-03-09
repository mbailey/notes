# AWS Vault

- [GitHub - 99designsaws-vault A vault for securely storing and accessing AWS credentials in development environments](https://github.com/99designs/aws-vault)

## AWS CLI login

Set ENV in subshell:

```
aws-vault exec --no-session bash-my-aws # no-session removes STS / IAM restrictions
```

```
aws-vault exec bash-my-aws # defaults to creating temporary session
```

With metadata server (to refresh tokens):

```
aws-vault exec --server
```

## AWS Console Login

```
aws-vault login bash-my-aws
```

### Firefox containers


```
$(aws-vault login -s staging)
```