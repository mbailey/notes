# Mouse support

By claude-3-5-sonnet

To enable mouse support in tmux for scrolling, you can either:

1. Run this command in your current tmux session:
```bash
tmux set -g mouse on
```

2. Or add this line to your ~/.tmux.conf file for permanent effect:
```bash
set -g mouse on
```

After adding it to the config file, you'll need to either:
- Reload tmux config with: `tmux source-file ~/.tmux.conf`
- Or restart tmux

With mouse mode enabled, you can:
- Use the mouse wheel to scroll through terminal history
- Click and drag to select text
- Click pane borders to resize them