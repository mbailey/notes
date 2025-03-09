---
alias: GitLens
---
# GitLens

## Open on remote with different ssh domains
If you want to use SSH keys with more than one GitHub account, you might want this to enable "Open on Remote".

**VS Code GitLens settings**:

This works with the SSH Keytags convention introduced by [Keycutter](https://github.com/bash-my-aws/keycutter)

```
  "gitlens.remotes": [
  
    {
      "regex": "github.com_*",
      "type": "Custom",
      "name": "github.com_custom",
      "protocol": "https",
      "urls": {
        "repository": "https://github.com/${repo}",
        "branches": "https://github.com/${repo}/branches",
        "branch": "https://github.com/${repo}/commits/${branch}",
        "commit": "https://github.com/${repo}/commit/${id}",
        "file": "https://github.com/${repo}?path=${file}${line}",
        "fileInBranch": "https://github.com/${repo}/blob/${branch}/${file}${line}",
        "fileInCommit": "https://github.com/${repo}/blob/${id}/${file}${line}",
        "fileLine": "#L${line}",
        "fileRange": "#L${start}-L${end}"
      }
    }
  ],
```
