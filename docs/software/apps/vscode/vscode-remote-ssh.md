# VS Code - Remote-SSH Extension

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

## Configure for Windows with WSL

We can make VS Code on Windows use WSL for SSH.

**Benefits include:**

- Use config from `~/.ssh/config` instead of having to copy it to Windows.
- Use OpenSSH from linux instead of whatever Microsoft provides (they're not that into SSH).
 
*As of 5 Aug 2024 I don't have SSH Agent Forwarding working through this yet.*

### Steps to configure for WSL

I used VSCode 1.93 (insiders build) as the July release broke bad.

1. **Put a simple Windows batch file on the Windows filesystem:**

    ```
    # %USERPROFILE%/ssh.bat
    C:\Windows\system32\wsl.exe --exec bash -ic "echo 'Debug: Inside WSL'; echo 'Debug: Running ssh %*'; ssh %*"
    ```
    
2. **Tell vscode to use it by setting `remote.SSH.path`:**

    ```json
    {
        "remote.SSH.path": "%USERPROFILE%\\\\ssh.bat",
        "remote.SSH.useCurlAndWgetConfigurationFiles": true,
        "remote.SSH.permitPtyAllocation": true,
        "remote.SSH.remoteServerListenOnSocket": true,
        "remote.SSH.enableAgentForwarding": false,
        "remote.SSH.enableRemoteCommand": true,
        "remote.SSH.remotePlatform": {
            "*": "linux"
        }
    }
    ```

3. VSCode 1.93 (insiders build) looked for SCP in same dir as `ssh.bat`

    ```
    cp /mnt/c/Program\ Files/OpenSSH/scp.exe /mnt/c/User/<username>/
    ```



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
