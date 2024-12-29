# Rebase a local branch on upstream master


## Steps
### 1. Sync your fork with upstream

```shell
git fetch upstream
git checkout master
git status # Check for any local changes
git reset --hard upstream/master
git push
```

### 2. Rebase your branch

```shell
git fetch upstream
git rebase upstream/master
```



## Troubleshooting

### Rewritten commits

If you rebase from upstream you may inadvertantly modify the commits by changing `Commit:` to yourself.

```txt
commit eb9c41f2a0087e90936d55d3e4ba3c9b7be3e517 (HEAD -> main, upstream/main)
Author:     Paul Gauthier <paul@aider.chat>
AuthorDate: Tue Dec 17 13:42:59 2024 -0800
Commit:     Paul Gauthier (aider) <paul@aider.chat>
CommitDate: Tue Dec 17 13:42:59 2024 -0800

    feat: Enable complete_while_typing in prompt_session
```