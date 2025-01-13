## Config

- `~/.tmux.conf` 
- `~/.config/tmux/tmux.conf` (XDG Base Directory specification)

Tmux looks for configuration files in the following locations, in order of precedence:

1. Command line option: `-f path`
2. User's config: `~/.tmux.conf`
3. System-wide config: `/etc/tmux.conf`
4. `~/.config/tmux/tmux.conf` (XDG Base Directory specification) # newer versions

The most common location used is `~/.tmux.conf`

You can verify which config file tmux is using by running:
```bash
tmux show-options -g config-file
```

And you can check what version of tmux you're running (which might affect config file locations) with:
```bash
tmux -V
```


`tmux source-file ~/.tmux.conf`: source changes without restarting session