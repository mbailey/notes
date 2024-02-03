---
alias: VS Code - Visial Studio Code
---
# VS Code - Visual Studio Code

[Visual Studio Code - Code Editing. Redefined (code.visualstudio.com)](https://code.visualstudio.com/)

## Pages

- [Extensions](software/apps/vscode/vscode-extensions.md)
- [VSCode Remote](software/apps/vscode/vscode-remote.md)

## Keyboard Shortcuts 

### Default

ALT-Z: toggle line wrap
Ctrl-K K: toggle light/dark (my setting)
Ctrl-K Z: Zen mode (focus on the code) - click and drag edges
Ctrl-ALT--: Go Back
CTRL-ALT up/down: Multiple cursors
ALT-click: put cursors in multiple spots

### Custom

*Disable* **Ctrl + F**: Vim: editorFocus... # It gets in the way of standard Find

## Activity Bar

`CTRL-B`: Toggle visibility of Activity Bar
`CTRL-SHIFT+E`: Show Explorer
`CTRL-SHIFT+G G`: Show Git

## VIM

"vim.vimrc.enable": true

## Ctrl-SHIFT-P

- Collapse Folders in Explorer

## Handy commands

**Add folder to workspace**: `code --add .`
**Diff from last save**: Ctrl-K-D

### shebang

```
"shellcheck.arguments": [
    "--format=gcc",
    "--severity=warning",
    "--shell=bash",
    "--external-sources",
    "--enable=all",
    "--shebang=#!/usr/bin/env bash"
],
```


## Install

- [Running Visual Studio Code on Linux (code.visualstudio.com)](https://code.visualstudio.com/docs/setup/linux)

Install Key and Yum repo:

```shell
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

Then update the package cache and install the package using dnf (Fedora 22 and above):

```shell
dnf check-update
sudo dnf install code
```

## Settings

File locations:

- `~/.config/Code/User`
- `~/.config/Code/Workspaces`
- `~/.vscode`
    - `argv.json` : pass permanent command line arguments to VS Code.
    - `extensions`: your extensions live here

View the default values in the Settings editor or see a read-only version of the [`defaultSettings.json`][defaults] via **Preferences: Open Default Settings (JSON)**

My preferred settings:

| Setting  ID              | Value   | Comment                                          |
| ------------------------ | ------- | ------------------------------------------------ |
| git.rebaseWhenSync       | true    | Always use rebase instead of merge when running. |
| files.insertFinalNewline | true    | Insert final newline into file when saving       |

[defaults]: https://code.visualstudio.com/docs/getstarted/settings#_default-settings

### Terminal settings

### Keyboard Shortcuts - Default

**CTRL-m**: View: Toggle Maximised Panel

### Keyboard Shortcuts - Custom


**CTRL + l**: Terminal: Clear # Normal shell behaviour

### Annoyance: Tab Key Moves Focus

[This breaks shell completion in terminal if it's enabled](https://stackoverflow.com/questions/77167764/why-is-vs-code-using-the-tab-key-to-move-focus-from-the-integrated-terminal-inst)

![](assets/Pasted%20image%2020231222090143.png)



#### Terminal › Integrated: Allow Chords

- Make things like `CTRL-L`` work.

Whether or not to allow chord keybindings in the terminal. Note that when this is true and the keystroke results in a chord it will bypass [Terminal › Integrated: Commands To Skip Shell](vscode-file://vscode-app/usr/share/code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html "terminal.integrated.commandsToSkipShell"), setting this to false is particularly useful when you want ctrl+k to go to your shell (not VS Code).



## Shortcuts

```yaml
Ctrl-p-p: Go back to previous file
CTRL+ALT+-: Go back
```

## Git

- I'm using 1.73.1 (October 2022) on Linux

- Opening multiple repos allows for a great Git status summary view
- Click on the repo to see only those changes below
  
![](assets/vscode-git-status-summary.png)

Enable `Source Control Repositories` from the `...` menu next to `SOURCE CONTROL` to view the list.

![](assets/vscode-enable-source-control-repositories.png)

### Configure to show number of uncommitted changes in each repo

![](assets/Pasted%20image%2020231113153202.png)

### Copy GitHub URL for document

The extension Gitlens by Eric Amodio gives the Copy Remote URL option in the context menu.

The command is: gitlens.copyRemoteFileUrlToClipboard

I had to configure my non-standard domains in [`gitlens.remotes`](https://github.com/gitkraken/vscode-gitlens#remotes)

## GUI

Open two terminals with horizontal split:

- Open a first terminal
- Open a second one
- Right click a terminal and select "move to editor area"

## Troubleshooting


## .gitignore from different folders respected

- [Annoyance - Features (including quickopen, git) exclude files based on .gitignore (even if in different folder!)](https://github.com/microsoft/vscode/issues/15604)

### File watchers

- [Visual Studio Code is unable to watch for file changes in this large workspace" (error ENOSPC)](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)

![](assets/vscode-unable-to-watch-for-file-changes.png)

Check your watcher limits, current usage and how to increase the limits for [inotify](software/unix-commands/inotify.md)

```json

Maybe exclude some from vscode watchers:
```json
"files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/node_modules/*/**": true
  }
```



