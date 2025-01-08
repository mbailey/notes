# The Leader Key in Neovim

The leader key is a special prefix key for custom keyboard shortcuts (mappings). When you see a command prefixed with `<leader>` (like `<leader>e`), it means:
1. Press your leader key first (\ or space)
2. Then press the specified key (like 'e')

## Default Setting
By default, the leader key is set to backslash (`\`). Many users prefer to map it to the space key for easier access:

```lua
vim.g.mapleader = " "  -- Set leader to space
```

## Purpose
Leader mappings are meant for users and plugins to define their own shortcuts without conflicting with Neovim's built-in commands. Neovim doesn't include any leader mappings by default.

## Example Usage
In our nvim-tree.lua config, we defined:
- `<leader>e` to toggle the file explorer
- `<leader>f` to focus the current file in the explorer

This means if your leader is space, you'd press:
- `Space` then `e` to toggle the explorer
- `Space` then `f` to focus the current file
