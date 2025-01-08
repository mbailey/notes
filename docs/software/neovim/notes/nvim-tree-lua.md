# nvim-tree.lua

A file explorer tree for Neovim that focuses on speed, usability and concise UI. It provides a sidebar view of your project's files with Git integration and icon support.

## Usage
- Open/close tree: `:NvimTreeToggle`
- Focus tree: `:NvimTreeFocus` 
- Find current file: `:NvimTreeFindFile`
- Navigate with standard Vim movements (hjkl)
- Press `?` in tree view for help

## Install

nvim-tree.lua requires Neovim 0.8.0 or higher. Follow these steps to install:

1. Install a package manager if you haven't already (example using Packer):
```lua
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Add this to your init.lua:
```lua
-- Using Packer
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
}
```

3. Run `:PackerSync` in Neovim to install

## Config

The plugin needs to be configured before use. Add this to your init.lua:

```lua
-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Basic setup with detailed option explanations
require("nvim-tree").setup({
  -- Sort folders case-sensitively
  sort_by = "case_sensitive",
  
  view = {
    -- Width of the window in characters
    width = 30,
  },
  
  renderer = {
    -- Compact folders that only contain a single folder
    group_empty = true,
  },
  
  filters = {
    -- Hide dotfiles (files starting with a .)
    dotfiles = true,
  },
  
  git = {
    -- Enable git integration
    enable = true,
    -- Show git status icons
    ignore = false,
  },
  
  actions = {
    -- Automatically close tree when opening a file
    open_file = {
      quit_on_open = false,
    },
  },
})

-- Recommended key mappings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')  -- Toggle tree view
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>') -- Focus current file in tree
```
