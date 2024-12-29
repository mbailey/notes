---
alias: tmux
---
# tmux

tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

- [tmux/tmux Wiki (github.com)](https://github.com/tmux/tmux/wiki)
- [A Quick and Easy Guide to tmux - Ham Vocke (hamvocke.com)](https://hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
- [Tmux Cheat Sheet & Quick Reference (tmuxcheatsheet.com)](https://tmuxcheatsheet.com/)


## Usage


## Commands

| Name                  | Purpose                         | Example                                        |
| --------------------- | ------------------------------- | ---------------------------------------------- |
| 🔗 **attach-session** | Connect to existing session     | `tmux attach -t mysession`                     |
| 🆕 **new-session**    | Create new session              | `tmux new -s mysession`                        |
| 📋 **list-sessions**  | Show all sessions               | `tmux ls`                                      |
| 🚪 **detach-client**  | Leave session without ending it | `Ctrl+b d`                                     |
| 📝 **rename-session** | Change session name             | `Ctrl+b $ newname`                             |
| 🗑️ **kill-session**  | End a session                   | `tmux kill-session -t mysession`               |
| ⬜ **split-window**    | Create new pane                 | `Ctrl+b %` (vertical), `Ctrl+b "` (horizontal) |
| 🪟 **new-window**     | Create new window               | `Ctrl+b c`                                     |
| 📍 **select-pane**    | Switch between panes            | `Ctrl+b arrow-key`                             |
| 🔄 **swap-pane**      | Rearrange panes                 | `Ctrl+b {` or `Ctrl+b }`                       |
| 📜 **copy-mode**      | Enter scroll/copy mode          | `Ctrl+b [`                                     |
| 🔎 **find-window**    | Search for window               | `Ctrl+b f pattern`                             |

## Install

`sudo dnf install tmux`

## Configure

`~/.tmux.conf` 

`tmux source-file ~/.tmux.conf`: source changes without restarting session

`tmux new-session -d -s work -n InitialWindow`: Create session in detached mode