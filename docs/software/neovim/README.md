---
alias: Neovim
---
# Neovim




alias vim=nvim

nvim +PackerSync

## Plugins

- [Explorer Plugins](explorer-plugins.md) - File explorer plugin options and recommendations

## Commands

## Features

- Code formatting: See [formatting](formatting.md) for ways to indent and format code
- File navigation: Built-in file explorer and tree plugins available
- Key mappings: Customizable shortcuts using the [leader](leader.md) key

## Shortcuts

The [leader](leader.md) key is a special prefix for custom keyboard shortcuts that defaults to backslash (`\`).

| Action               | Shortcut    | Notes                          |
| -------------------- | ----------- | ------------------------------ |
| Toggle file explorer | `<leader>e` | Open/close nvim-tree sidebar   |
| Focus current file   | `<leader>f` | Show current file in nvim-tree |

## Built-in Commands

| Action | Command | Notes |
|--------|---------|-------|
| Return to file explorer [↗](questions/return-to-file-explorer.md) | `:Ex` | From current buffer to directory view |
| Return to file explorer | `:Rex` | Return to last explorer view |
| Return to file explorer | `-` | If using netrw (built-in file explorer) |
