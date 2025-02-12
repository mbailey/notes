# fzf

A command-line fuzzy finder that enhances your terminal workflow.

- [GitHub Repository](https://github.com/junegunn/fzf)

## Usage

## Shell Keybindings

FZF provides three key bindings to enhance shell interaction:

| Keybinding | Description |
|------------|-------------|
| `Ctrl+T` | Paste selected files/directories into command line |
| `Ctrl+R` | Search command history |
| `Alt+C` | CD into selected directory |

Enable these bindings by adding to your `~/.bashrc` (if not enabled globally):

```bash
# For Debian/Ubuntu
source /usr/share/doc/fzf/examples/key-bindings.bash

# For Fedora/RedHat
source /usr/share/fzf/shell/key-bindings.bash
```

## Installation

### Linux

```bash
# Ubuntu/Debian
sudo apt install fzf

# Fedora
sudo dnf install fzf

# Install shell extensions (recommended)
# This adds key bindings (CTRL-T, CTRL-R, ALT-C) and fuzzy auto-completion
/usr/share/doc/fzf/install
```

### macOS

```bash
brew install fzf

# Install shell extensions (recommended)
# This adds key bindings (CTRL-T, CTRL-R, ALT-C) and fuzzy auto-completion
$(brew --prefix)/opt/fzf/install
```
