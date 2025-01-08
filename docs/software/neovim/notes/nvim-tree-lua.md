# nvim-tree.lua

A file explorer tree for Neovim that focuses on speed, usability and concise UI. It provides a sidebar view of your project's files with Git integration and icon support.

## Usage
- Open/close tree: `:NvimTreeToggle`
- Focus tree: `:NvimTreeFocus` 
- Find current file: `:NvimTreeFindFile`
- Navigate with standard Vim movements (hjkl)
- Press `?` in tree view for help

## Install
```lua
-- Using Packer
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
}
```

## Config
```lua
-- Basic setup
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Recommended key mappings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>')
```
