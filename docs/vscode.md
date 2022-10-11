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

| Setting  ID              | Value   | Comment                                          |
| ------------------------ | ------- | ------------------------------------------------ |
| git.rebaseWhenSync       | true    | Always use rebase instead of merge when running. |
| files.insertFinalNewline | true    | Insert final newline into file when saving       |

[defaults]: https://code.visualstudio.com/docs/getstarted/settings#_default-settings

## Extensions

Install:

    $ code --install-extension vscodevim.vim

### List:

```shell
$ code --list-extensions
yzhang.markdown-all-in-one
aws-scripting-guy.cform
bierner.markdown-mermaid
csholmq.excel-to-markdown-table
DavidAnson.vscode-markdownlint
donjayamanne.githistory
eamodio.gitlens
ms-python.pylint
ms-python.python
ms-python.vscode-pylance
vscodevim.vim
redhat.vscode-yaml
ms-vscode.makefile-tools
mushan.vscode-paste-image
sidthesloth.html5-boilerplate
timonwong.shellcheck
telesoho.vscode-markdown-paste-image
wholroyd.jinja
pharndt.vscode-markdown-table
```

Had these but didn't keep:
```
almenon.arepl
batisteo.vscode-django
BillDietrich.linkcheckerhtml
bung87.rails
bung87.vscode-gemfile
donjayamanne.python-environment-manager
donjayamanne.python-extension-pack
esbenp.prettier-vscode
frhtylcn.pythonsnippets
golang.go
kddejong.vscode-cfn-lint
KevinRose.vsc-python-indent
kiteco.kite
loganarnett.lambda-snippets
ms-azuretools.vscode-docker
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-slideshow
ms-vsliveshare.vsliveshare
ms-vsliveshare.vsliveshare-audio
ms-vsliveshare.vsliveshare-pack
njpwerner.autodocstring
rebornix.ruby
shd101wyy.markdown-preview-enhanced
sianglim.slim
VisualStudioExptTeam.intellicode-api-usage-examples
VisualStudioExptTeam.vscodeintellicode
wingrunr21.vscode-ruby
```


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

