# VS Code "open file on remote"

It's a problem when I use custom domains in remote to prompt SSH to use the right key.


## Solution: GitLens Settings in VS Code



```
  "gitlens.remotes": [
    {
      "domain": "github-work",
      "type": "Custom",
      "name": "My Company",
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


- [Manage GitLens Settings (help.gitkraken.com)](https://help.gitkraken.com/gitlens/settings/#git-codelens-settings)

- Could maybe hack gitlens here to add support: https://github.com/gitkraken/vscode-gitlens/blob/main/src/commands/openOnRemote.ts#L161
## Settings

### gitlens.codeLens.authors.command

Specifies the command to be executed when an _authors_ CodeLens is clicked, set to (`gitlens.toggleFileBlame`) by default. Can be set to `false` to disable click actions on the CodeLens.

`gitlens.toggleFileBlame` – toggles file blame annotations  
`gitlens.toggleFileHeatmap` – toggles file heatmap  
`gitlens.toggleFileChanges` – toggles file changes since before the commit  
`gitlens.toggleFileChangesOnly` – toggles file changes from the commit  
`gitlens.diffWithPrevious` – opens changes with the previous revision  
`gitlens.revealCommitInView` – reveals the commit in the Side Bar  
`gitlens.showCommitsInView` – searches for commits within the range  
`gitlens.showQuickCommitDetails` – shows details of the commit  
`gitlens.showQuickCommitFileDetails` – show file details of the commit  
`gitlens.showQuickFileHistory` – shows the current file history  
`gitlens.showQuickRepoHistory` – shows the current branch history  
`gitlens.openCommitOnRemote` – opens the commit on the remote service (when available)  
`gitlens.copyRemoteCommitUrl` – copies the remote commit url to the clipboard (when available)  
`gitlens.openFileOnRemote` – opens the file revision on the remote service (when available)  
`gitlens.copyRemoteFileUrl` – copies the remote file url to the clipboard (when available)
