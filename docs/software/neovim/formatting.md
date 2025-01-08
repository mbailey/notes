# Code Formatting in Neovim

There are several ways to format code in Neovim:

## Built-in Commands

| Command | Description |
|---------|-------------|
| `gg=G` | Re-indent entire file (go to top, indent to bottom) |
| `=ip` | Re-indent current paragraph |
| `==` | Re-indent current line |
| `={motion}` | Re-indent the text selected by {motion} |
| `>>`/`<<` | Indent/outdent current line |
| `visual >` | Indent selected text (in visual mode) |

## Auto-formatting

For more advanced formatting:
1. Use LSP servers for language-specific formatting
2. Use null-ls/none-ls for additional formatters
3. Use external formatters like prettier, black, etc.

## Quick Tips
- After pasting: `=}` to format until next blank line
- In visual mode: `=` to format selected text
- For JSON files: `:%!jq .` to format using jq
