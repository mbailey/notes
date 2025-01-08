---
alias: Neovim
---
# Neovim




alias vim=nvim

nvim +PackerSync

## Plugins

- [Explorer Plugins](explorer-plugins.md) - File explorer plugin options and recommendations

## Commands

The "leader" key is a special prefix key used for custom commands. By default it's `\`, but many users map it to space using `let mapleader=" "` in their config.

| Action | Command | Notes |
|--------|---------|-------|
| Return to file explorer [↗](questions/return-to-file-explorer.md) | `:Ex` | From current buffer to directory view |
| Return to file explorer | `:Rex` | Return to last explorer view |
| Return to file explorer | `-` | If using netrw (built-in file explorer) |
