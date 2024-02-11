# GitLens

## Open on remote with different ssh domains

If you want to use SSH keys with more than one GitHub account, you might want this to enable "Open on Remote".

**VS Code GitLens settings**:

```
  "gitlens.remotes": [
    {
      "domain": "github-personal",
      "type": "Custom",
      "name": "github-personal",
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
    },
    {
      "domain": "github-work",
      "type": "Custom",
      "name": "github-work",
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