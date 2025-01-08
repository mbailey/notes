# Returning to File Explorer in Neovim

There are several ways to return to the file explorer view in Neovim:

## Built-in Commands

1. `:Ex` (short for `:Explore`)
   - Opens netrw in the current file's directory
   - Most universal method that works in any Neovim setup

2. `:Rex` (short for `:Rexplore`)
   - Returns to the last file explorer view
   - Useful when you want to go back to where you were browsing

3. `-` (hyphen key)
   - Quick shortcut when using netrw
   - Opens netrw in the current file's directory
   - Must be mapped in your config to work: `nnoremap - :Ex<cr>`

## Plugin-specific Methods

If you're using specific file explorer plugins, there might be additional commands:

- NERDTree: `<leader>nt` (common mapping) or `:NERDTreeFind`
- nvim-tree: `<leader>e` (common mapping) or `:NvimTreeToggle`
- Oil.nvim: `-` (default mapping) or `:Oil`

## Best Practices

1. Choose one primary method and make it muscle memory
2. Consider mapping a convenient key for quick access
3. Use `:Rex` when you want to maintain your browsing history
