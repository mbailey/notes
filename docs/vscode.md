# vscode

## Links
- [Annoyance - Features (including quickopen, git) exclude files based on .gitignore (even if in different folder!)](https://github.com/microsoft/vscode/issues/15604)

## Settings

File locations:

-  `~/.config/Code/User`
-  `~/.config/Code/Workspaces`
- `~/.vscode`
    - `argv.json` : pass permanent command line arguments to VS Code.
    - `extensions`: your extensions live here

View the default values in the Settings editor or see a read-only version of the [`defaultSettings.json`][defaults] via **Preferences: Open Default Settings (JSON)**

My preferred settings:
| Setting  ID                  | Value | Comment                                          |
| ------------------------ | ------- | ------------------------------------------------ |
| git.rebaseWhenSync       | true    | Always use rebase instead of merge when running. |
| files.insertFinalNewline | true    | Insert final newline into file when saving       |

[defaults]: https://code.visualstudio.com/docs/getstarted/settings#_default-settings

## Extensions

Install:

    $ code --install-extension vscodevim.vim

### List:
 
    $ code --list-extensions
    golang.go
    vscodevim.vim
    bmewburn.vscode-intelephense-client
    brapifra.phpserver
    DEVSENSE.phptools-vscode
    dhoeric.ansible-vault
    eamodio.gitlens
    firefox-devtools.vscode-firefox-debug
    formulahendry.code-runner
    GitHub.vscode-pull-request-github
    GrapeCity.gc-excelviewer
    hbenl.vscode-test-explorer
    mbehr1.vsc-webshark
    mechatroner.rainbow-csv
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.test-adapter-converter
    redhat.ansible
    redhat.vscode-yaml
    xdebug.php-debug

## Shortcuts

```txt
Ctrl-p-p: Go back to previous file
```

## GUI

Open two terminals with horizontal split:
- Open a first terminal
- Open a second one
- Right click a terminal and select "move to editor area"

