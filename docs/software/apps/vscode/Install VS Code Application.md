## Install VS Code Application
### Fedora

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