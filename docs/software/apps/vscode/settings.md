# VS Code Settings

Notes on configuring VS Code.

## Managing your settings

- TBC

## Setting values

### Enable VIM mode

"vim.vimrc.enable": true
### Show count of changes in Repos

```shell
"scm.providerCountBadge": "visible"
```

### Git: Auto Stash: Dangerous!

- If you're using some other kind of sync (Obsidian) it will delete the files on your other device temporarily.
- If you get a merge conflict you may need to manually apply the stash or else wonder where all your changes went.

```json
"git.autoStash": false
```

