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

## Configuration

### Shell Configuration

Add to your ~/.bashrc or ~/.zshrc:

```bash
# fzf configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Custom key bindings
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
```

### Custom Color Scheme

```bash
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#d0d0d0,bg:#121212,hl:#5f87af
--color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff
--color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
--color=marker:#87ff00,spinner:#af5fff,header:#87afaf'
```
