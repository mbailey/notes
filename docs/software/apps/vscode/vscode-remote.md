# vscode remote

Develop on remote machines using Visual Studio Code and SSH.

## Install

Enable extension:
```
code --install-extension ms-vscode-remote.remote-ssh
```
Connect to remote host:

- CTRL-SHIFT-P
- Select `Remote-SSH: Connect to Host`
- Select a host
- VSCode will install VS Code Server on remote host if not present.

## Notes

### remote.SSH.defaultExtensions

- ["Always installed" extensions (code.visualstudio.com)](https://code.visualstudio.com/docs/remote/ssh#_always-installed-extensions)
- I maintain a list of [extensions](extensions.md)

If there are extensions that you would like to always have installed on any SSH host, you can specify which ones using the `remote.SSH.defaultExtensions`property in `settings.json`. For example, if you wanted to install the [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) and [Resource Monitor](https://marketplace.visualstudio.com/items?itemName=mutantdino.resourcemonitor)extensions, specify their extension IDs as follows:

```
"remote.SSH.defaultExtensions": [
"amazonwebservices.aws-toolkit-vscode"
]
```


## See also

- [Developing on Remote Machines using SSH and Visual Studio Code (code.visualstudio.com)](https://code.visualstudio.com/docs/remote/ssh)
- [microsoft/vscode-remote-release (github.com)](https://github.com/Microsoft/vscode-remote-release)
