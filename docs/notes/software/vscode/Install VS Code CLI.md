### Install VS Code CLI

The `code` command make it easy to open paths from the command line.

#### Linux

Add it to your PATH with a symlink:

```shell
sudo ln -sr /usr/share/code/bin/code "${XDG_BIN_HOME:-$HOME/.local/bin}"/code
```

For the insiders version:

```shell
ln -sr /usr/share/code-insiders/bin/code-insiders "${XDG_BIN_HOME:-$HOME/.local/bin}"/code-insiders
```

#### macOS

- https://code.visualstudio.com/docs/setup/mac

```shell
cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
```