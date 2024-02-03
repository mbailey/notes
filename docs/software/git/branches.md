# Git branches

Checkout a remote branch:

```shell
git fetch origin
git checkout BRANCH_NAME 
```


**Delete remote branch**:

```shell
git push --delete <remote_name> <branch_name>
```

**Rename default branch**: 

I don't want to have to remember what the default branch is named.

    git branch -m main master
    git push -u origin master

- [stackoverflow](https://stackoverflow.com/a/69344918/660017)

**List branches in order of most recent commit**

```shell
$ git for-each-ref --sort=-committerdate refs/remotes/ --format="%(refname:short)%09%(committerdate:iso8601)%09%(committername)%09%(subject)" | columnise 
origin/feat-fix                            2023-02-08 17:46:47 +1100  Some Person     Fixing the stack name to make it unique
origin/r53-feat                            2023-02-08 17:15:10 +1100  Another Person  Renaming the file
```

